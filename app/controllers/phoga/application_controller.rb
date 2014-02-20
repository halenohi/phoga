class Phoga::ApplicationController < ActionController::Base
  before_filter :authenticate_admin!
  layout 'phoga/application'
end
