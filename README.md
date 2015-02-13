[![Gem Version](https://badge.fury.io/rb/paginas.svg)](http://badge.fury.io/rb/paginas)  
Paginas Gem
================

Provides basic pages functionality to your app.  
Pages can be organized by category and there is also a couple of helpful helpers for adding page links to your menu bars  
For screenshots visit [here](http://www.carlos-roque.com/paginas-gem/)

Getting Started
---------------
* [Installing](https://github.com/CarlosRoque/paginas/wiki/Installing)  
* [Using The Gem](https://github.com/CarlosRoque/paginas/wiki/Using-the-gem)  
* [Customizing The Views](https://github.com/CarlosRoque/paginas/wiki/Customizing-the-views)  

Menu Link Markup Generation
---------------------------
If you want to generate markup for your menu, Paginas provides two helpful helpers for your view. You can either pass a hash, where the key will be the name of the menu item and the value is the id of the page you want to link to, or a category id.
* [paginas_menu_helper_by_pages](https://github.com/CarlosRoque/paginas/wiki/paginas_menu_helper_by_pages%28-ids,-options-=-%7B%7D-%29)
* [paginas_menu_helper_by_cat](https://github.com/CarlosRoque/paginas/wiki/paginas_menu_helper_by_cat%28catid,options-=-%7B%7D%29)

Rolify, CanCan and Devise Integration
--------------------------------------
These isntructions assume you already have rolify and CanCan OR Devise OR all three gems already installed in your app  
* [Prepare Routes and Controllers](https://github.com/CarlosRoque/paginas/wiki/Routes-And-Controllers)
* [Rolify And CanCan](https://github.com/CarlosRoque/paginas/wiki/Rolify-and-CanCan)
* [Devise](https://github.com/CarlosRoque/paginas/wiki/Devise)
* [Rolify,CanCan and Devise](https://github.com/CarlosRoque/paginas/wiki/Rolify-and-CanCan-and-Devise)

Known Issues
---------------------
* [Turbolinks Workaround](https://github.com/CarlosRoque/paginas/wiki/Turbolinks-workaround) Fixed as of v0.2.0
