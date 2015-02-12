Simple Pages Gem
================

Provides basic pages functionality to your app

Installing
-----------
Add these to your Gemfile
```ruby
gem "simple_pages"
gem "tinymce-rails"
```

configure your routes file
config/routes.rb
```ruby
mount SimplePages::Engine, at: "/sp"
```
and your application.js
app/assets/javascript/application.js
```ruby
//= require simple_pages
```
set up the database by running
```bash
rake simple_pages:install:migrations
```
and
```bash
rake db:migrate
```

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

finally, if you want to modify the default views you can run
```bash
rails generate simple_pages:views
```
