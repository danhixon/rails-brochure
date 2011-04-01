module Rails
  module Brochure
    class HomeContent
      #TODO: replace with cattr_accessor:
      HOME_FOLDER_PATH = "app/views/home/"
      def self.newest
        HomeContent.files.map { |f| File.new(f) }.sort { |a,b| a.ctime <=> b.ctime }.map { |f| f.ctime }.last
      end
      def self.files
        Dir.glob("#{HOME_FOLDER_PATH}**/*.html.*")
      end
      def self.templates
        HomeContent.files.map do |f| 
          f.gsub(/(#{HOME_FOLDER_PATH}|.html.\w+)/,"")
        end
      end
    end
  end
end