Rails.application.routes.draw do
  Rails::Brochure::HomeContent.templates.each do |pg|
    match "/#{pg}" => "home##{pg}", :as => pg.gsub(/(\/|-)/,'_').to_sym
  end
  match '*a', :to => 'home#four_zero_four' unless defined?(NONBROCHURE404) && ActionController::Base.consider_all_requests_local
end

