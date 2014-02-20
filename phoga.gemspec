$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "phoga/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "phoga"
  s.version     = Phoga::VERSION
  s.authors     = ["kozo yamagata"]
  s.email       = ["kozo@halenohi.jp"]
  s.homepage    = "http://phoga.halenohi.jp"
  s.summary     = "This is CMS"
  s.description = "This is awesome CMS"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir['spec/**/*']

  s.add_dependency "rails", "~> 4.0.2"
  s.add_dependency "coffee-rails", "~> 4.0.1"
  s.add_dependency "sass-rails", "~> 4.0.1"
  s.add_dependency "haml-rails", "~> 0.5.3"
  s.add_dependency "uglifier", "~> 2.4.0"

  s.add_dependency "jquery-rails", "~> 3.1.0"
  s.add_dependency "bootstrap-sass", "~> 3.1.0.2"
  s.add_dependency "font-awesome-sass-rails", "~> 3.0.2.2"
  s.add_dependency "backbone-on-rails", "~> 1.1.0.0"

  s.add_dependency "mini_magick"
  s.add_dependency "carrierwave"
  s.add_dependency "fog"
  s.add_dependency "kaminari"

  s.add_dependency "cells"
  s.add_dependency "rails_autolink"

  s.add_dependency "devise"
  s.add_dependency "cancan"

  s.add_dependency "sidekiq"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency 'tapp'
end
