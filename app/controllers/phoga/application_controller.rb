# coding: utf-8
class Phoga::ApplicationController < ActionController::Base
  before_filter :authenticate_user!

  layout 'phoga/application'
end
