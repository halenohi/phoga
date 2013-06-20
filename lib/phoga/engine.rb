module Phoga
  class Engine < ::Rails::Engine
    require 'haml'
    require 'bootstrap-sass'

    isolate_namespace Phoga

    config.generators do |g|
      g.template_engine :haml
      g.test_framework :rspec
      g.integration_tool :rspec
    end
  end
end
