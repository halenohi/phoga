require 'haml'
require 'bootstrap-sass'
require 'jquery-rails'
require 'backbone-on-rails'

require 'devise'
require 'cancan'

require 'kaminari'
require 'carrierwave'

module Phoga
  class Engine < ::Rails::Engine
    isolate_namespace Phoga

    config.generators do |g|
      g.template_engine :haml

      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.integration_tool :rspec
    end

    initializer 'phoga.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Phoga::ApplicationHelper
      end
    end
  end
end
