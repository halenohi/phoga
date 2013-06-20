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

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "coffee-rails", "~> 3.2.1"
  s.add_dependency "sass-rails", "~> 3.2.3"
  s.add_dependency "haml-rails"
  s.add_dependency "uglifier", ">= 1.0.3"

  s.add_dependency "jquery-rails"
  s.add_dependency "bootstrap-sass"
  s.add_dependency "font-awesome-sass-rails"
  s.add_dependency "backbone-on-rails"

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
end
