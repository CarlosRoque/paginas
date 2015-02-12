Paginas Gem
================

Provides basic pages functionality to your app

Installing
-----------
Add these to your Gemfile
```ruby
gem "paginas"
gem "tinymce-rails"
```
Run Bundle from your app root
```bash
bundle install
```
configure your config/routes.rb
```ruby
mount Paginas::Engine, at: "/paginas"
```
and your app/assets/javascript/application.js
```ruby
//= require paginas
```
set up the database by running
```bash
rake paginas:install:migrations
```
and
```bash
rake db:migrate
```
Using the app
--------------
to view the main list you can now go to
```bash
yourappurl/sp
```

to view a list of featured pages
```bash
yourappurl/sp/featured
```
to display a page to the world use links of the form
```bash
yourappurl/sp/display/:id
```

Customizing the views
----------------------
finally, if you want to modify the default views you can run
```bash
rails generate paginas:views
```
this will create a folder called paginas in your app/views folder

Rolify, CanCan and Devise integration
================================
These isntructions assume you already have rolify and CanCan OR Devise OR all three gems already installed in your app

Routes and Controller
---------------------
Regardles of wich integration you need, you will have to extend paginas controller and change the way the routes are generated in your routes file

### Extending the controller
Create app/controllers/pages_controller.rb and add the following code
```ruby
class PagesController < Paginas::PagesController
end
```
### Routes
Now in your config/routes.rb REMOVE
```ruby
mount Paginas::Engine, at: '/paginas'
```
and add the following
```ruby
resources :pages
get 'featured', to: 'pages#featured'
get 'display/:id', to: 'pages#display', as: 'display'
```
#### Using the new routes
to view the main list you can now go to
```bash
yourappurl/pages
```

to view a list of featured pages
```bash
yourappurl/featured
```
to display a page to the world use links of the form
```bash
yourappurl/display/:id
```

Rolify and CanCan
------------------
Make your app/controller/pages_controller.rb look like this
```ruby
class PagesController < Paginas::PagesController
  load_and_authorize_resource class: Paginas::Page
end
```
This lets cancan load and authorize the resource. Now you can add abilities in your Abillities model app/models/ability.rb. You can do something like the following example

```ruby
class Ability
  include CanCan::Ability
  def initialize(user)
    alias_action :featured,:display, :to => :public_view

    user ||= User.new
    can :public_page, Paginas::Page # So we can publish the featured and display actions to the public

    if user.has_role? :admin
      can :manage, Paginas::Page
    elsif user.has_role? :staff
      can :read, Paginas::Page
    end
  end
end
```
Devise
--------
If you want to integrate with devise add make your app/controller/pages_controller.rb look like this
```ruby
class PagesController < Paginas::PagesController
  before_action :authenticate_user!
end
```
If you want to make featured and display public you can add
```ruby
  before_action :authenticate_user!, only: [:show,:edit,:new,:destroy,:update,:create]
```

Rolify and CanCan and Devise
----------------------------
Follow the Rolify and CanCan instructions and just make your controller look like this
app/controllers/pages_controller.rb
```ruby
class PagesController < Paginas::PagesController
  load_and_authorize_resource class: Paginas::Page
  before_action :authenticate_user!, only: [:show,:edit,:new,:destroy,:update,:create]
end
```
