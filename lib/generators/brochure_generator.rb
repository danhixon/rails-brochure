class BrochureGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def home
    copy_file "index.html.erb", "#{Rails.root}/app/views/home/index.html.erb"
    copy_file "four_zero_four.html.erb", "#{Rails.root}/app/views/home/four_zero_four.html.erb"
    copy_file "about.html.erb", "#{Rails.root}/app/views/home/about.html.erb"
  end
end
