module Phoga
  class Article < ActiveRecord::Base
    validates :admin_id,
      presence: true

    belongs_to :admin,
      class_name: 'Phoga::Admin'

    has_many :taggings,
      as: :taggable,
      dependent: :destroy,
      class_name: 'Phoga::Tagging'

    has_many :tags,
      through: :taggings,
      class_name: 'Phoga::Tag'

    has_many :comments,
      as: :commentable,
      dependent: :destroy,
      class_name: 'Phoga::Comment'

    has_many :categorizations,
      as: :categorizable,
      dependent: :destroy,
      class_name: 'Phoga::Categorization'
    accepts_nested_attributes_for :categorizations

    has_many :categories,
      through: :categorizations,
      class_name: 'Phoga::Category'

    has_many :custom_field_assignments,
      as: :assignable,
      dependent: :destroy,
      class_name: 'Phoga::CustomFieldAssignment'

    has_many :custom_fields,
      through: :custom_field_assignments,
      class_name: 'Phoga::CustomField'
  end
end
