Rails Brochure
============

Rails engine for brochure pages. Similar to High Voltage but with named routes.

Brochure pages are the semi-static pages like "home", "about us", "FAQ", "pricing", "contact us", etc.

Most of the designers I have worked with really appreciate the power and convenience this plugin provides. They are able to simply create erb files in folders like they are used to with static html or php and it just works.  No futzing with routes, controllers etc.

Installation
------------

Rails 3 required.

Include in your Gemfile:

    gem "rails-brochure"

Don't forget to install:

    $ bundle install

You can install from the command line as well:

    $ sudo gem install rails-brochure

Usage
-----

Write your static pages and put them in the RAILS_ROOT/app/views/home directory.

    mkdir app/views/home
    touch app/views/home/about.html.erb
    
After putting something interesting there, a named route is created and you can link to it from anywhere in your app with:

        link_to "About", about_url
        link_to "About", about_path
        
You can also create content in sub directories like this:
    
    mkdir app/views/home/about
    touch app/views/home/about/company

This will create a named route about_company:

    link_to "Company", about_company_url
    link_to "Company", about_company_path

Once you have an index template you may want to add this route to your config/routes.rb:

    root :to => "home#index"

Name Routes?
--------

Named routes are good because if you change a page name (about.html.erb to about_us.html.erb) without updating the links you'll get failing tests:

  ActionView::TemplateError: undefined local variable or method `about_path'


Override
--------

Some reasons you may want to override:

  * Need to grab some data from a database or something.
  * Need authentication around some pages
  * Need to render different layouts for different pages.
  
Create a HomeController of your own:

    rails generate controller home

Then just add in the actions you want to behave differently:

    class HomeController < ApplicationController
      before_filter :require_user, :only => :private_info
      
      def pricing
        @prices = Price.all
      end
    
      def index
        # index page has it's own layout html
        render :layout => false
      end
      
      def private_info
        @info = current_user.private_info
      end
      
    end

Enjoy!

License
-------

Rails Brochure is Copyright © 2010-2011 Dan Hixon. It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.