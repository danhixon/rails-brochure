# Engine injects some middleware to reload 
# routes if new files habe been added
module Rails
  module Brochure
    class Engine < Rails::Engine
      initializer "brochure routes" do |app|
        app.middleware.use Rails::Brochure::RouteReloader
      end if Rails.env.development?
    end
  end
end