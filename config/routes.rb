Rails.application.routes.draw do
  Rails::Brochure::HomeContent.templates.each do |page_path|
    action_name = page_path.gsub(/(\/|-)/,'_') # slashes and dashes become underscores
    get "/#{page_path}" => "home##{action_name}", :as => action_name.to_sym
    HomeController.class_eval {
      define_method action_name.to_sym do
        render "home/#{page_path}"
      end
    }
  end
  get '*a', :to => 'home#four_zero_four' unless defined?(NONBROCHURE404) && Rails.application.config.consider_all_requests_local
end

