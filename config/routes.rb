Rails.application.routes.draw do
  Rails::Brochure::HomeContent.templates.each do |pg|
    get "/#{pg}" => "home##{pg}", :as => pg.gsub(/(\/|-)/,'_').to_sym
  end
  get '*a', :to => 'home#four_zero_four' unless defined?(NONBROCHURE404) && Rails.application.config.consider_all_requests_local
end

