require 'haml'
require 'bootstrap-sass'
require 'devise'
require 'kaminari'

module Phoga
  class Engine < ::Rails::Engine
    isolate_namespace Phoga

    config.generators do |g|
      g.template_engine :haml

      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.integration_tool :rspec
    end
  end
end
