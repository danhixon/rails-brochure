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
        HomeContent.file_names.map { |f| File.new(f) }.sort { |a,b| a.ctime <=> b.ctime }.map { |f| f.ctime }.last
      end

      def self.file_names
        files = Dir.glob("#{home_folder_path}**/*.{#{Mime::EXTENSION_LOOKUP.keys.join(",")}}.*")
        #puts files.inspect
        files.delete_if { |f| f.end_with?(".orig") || f.start_with("_") }
        files
      end

      def self.templates
        HomeContent.file_names.map do |f|
          f.gsub(/(#{home_folder_path}|\.(#{Mime::EXTENSION_LOOKUP.keys.join("|")})\.\w+)/,"")
        end
      end

    end
  end
end
