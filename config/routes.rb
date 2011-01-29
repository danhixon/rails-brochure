Rails.application.routes.draw do
  Rails::Brochure::HomeContent.templates.each do |pg|
    match "/#{pg}" => "home##{pg}", :as => pg.gsub('/','_').to_sym
  end
end