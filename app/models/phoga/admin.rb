module Phoga
  class Admin < ActiveRecord::Base
    devise :database_authenticatable, :registerable, :confirmable,
           :recoverable, :rememberable, :trackable, :validatable

    has_many :articles,
      class_name: 'Phoga::Article'
  end
end
