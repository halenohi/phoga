module Phoga
  class Article < ActiveRecord::Base
    validates :admin_id,
      presence: true

    belongs_to :admin,
      class_name: 'Phoga::Admin'

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
