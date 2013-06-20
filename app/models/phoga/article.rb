module Phoga
  class Article < ActiveRecord::Base
    attr_accessible :body, :title,
                    :published_at,
                    :user_id

    validates :user_id,
      presence: true

    belongs_to :user,
      class_name: 'Phoga::User'

    has_many :taggings,
      as: :taggable,
      dependent: :destroy

    has_many :tags,
      through: :taggings
  end
end
