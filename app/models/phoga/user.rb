module Phoga
  class User < ActiveRecord::Base
    devise :database_authenticatable, :registerable, :confirmable,
           :recoverable, :rememberable, :trackable, :validatable

    attr_accessible :email, :password, :password_confirmation, :remember_me,
                    :username, :description, :url, :avatar

    has_many :articles,
      class_name: 'Phoga::Article'
  end
end
