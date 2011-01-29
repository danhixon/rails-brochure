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
  s.summary     = %q{Rails Plugin for hosting static content files a-la-php with named routes.}
  s.description = %q{Rails Plugin for hosting static content files a-la-php with named routes.  It is a lot like high voltage but you get named routes and '/pages' is not part of your routes.}
 
  s.add_dependency('rails', '>= 3.0.0')
 
  s.rubyforge_project = "rails-brochure"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
