module Rails
  module Brochure
    class RouteReloader

      def initialize(app)
        @app = app
      end

      def call(env)
        reload_routes if new_content?
        @app.call(env)
      end

      def reload_routes
        # we must touch the routes file in order for it to be reloaded    
        FileUtils.touch("config/routes.rb")
        Rails.application.reload_routes!
        Rails.logger.info "ROUTES RELOADED by rails-brochure"
      end

      def new_content?
        return true if HomeContent.newest.nil? || last_route_change.nil?
        HomeContent.newest > last_route_change
      end

      def last_route_change
        File.mtime("config/routes.rb")
      end
      
    end
  end
end