module Rails
  module Brochure
    class HomeContent
      # This feature needs more work. 
      # You can change the folder path and the routes are correct
      # Rails::Brochure::HomeContent.home_folder_path = 'app/views/content/'
      # but the home controller looks in the home folder anyway...
      # So the home controller would need to use a different
      # directory. If I wanted to make this configurable i'd probably
      # ask for a controller name, define one (meta) and render the 
      # routes accordingly.
      @@home_folder_path = 'app/views/home/'
      cattr_accessor :home_folder_path

      def self.newest
        HomeContent.files.map { |f| File.new(f) }.sort { |a,b| a.ctime <=> b.ctime }.map { |f| f.ctime }.last
      end
      def self.files
        Dir.glob("#{home_folder_path}**/*.html.*")
      end
      def self.templates
        HomeContent.files.map do |f| 
          f.gsub(/(#{home_folder_path}|.html.\w+)/,"")
        end
      end
    end
  end
end