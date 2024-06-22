# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rails-brochure/version"

Gem::Specification.new do |s|
  s.name        = "rails-brochure"
  s.version     = Rails::Brochure::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Dan Hixon"]
  s.email       = ["danhixon@gmail.com"]
  s.homepage    = "http://github.com/danhixon/rails-brochure"
  s.summary     = %q{Rails engine for brochure pages. Similar to High Voltage but with named routes.}
  s.description = %q{Rails engine for brochure pages. Similar to High Voltage but with named routes.
  Brochure pages are the semi-static pages like "home", "about us", "FAQ", "pricing", "contact us", etc.
  Most of the designers I have worked with really appreciate the power and convenience this plugin provides. They are able to simply create erb files in folders like they are used to with static html or php and it just works.  No futzing with routes, controllers etc.}
 
  s.add_dependency('rails', '>= 5.0.0')
 
  s.rubyforge_project = "rails-brochure"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
