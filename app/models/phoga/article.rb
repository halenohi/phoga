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

    has_many :comments,
      as: :commentable,
      dependent: :destroy

    has_many :categorizations,
      as: :categorizable,
      dependent: :destroy

    has_many :categories,
      through: :categorizations

    has_many :custom_field_assignments,
      as: :assignable,
      dependent: :destroy

    has_many :custom_fields,
      through: :custom_field_assignments
  end
end
