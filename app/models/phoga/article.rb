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
    accepts_nested_attributes_for :taggings,
      allow_destroy: true,
      reject_if: :reject_tagging

    has_many :tags,
      through: :taggings,
      class_name: 'Phoga::Tag'

    has_many :categorizations,
      as: :categorizable,
      dependent: :destroy,
      class_name: 'Phoga::Categorization'
    accepts_nested_attributes_for :categorizations,
      allow_destroy: true,
      reject_if: :reject_categorization

    has_many :categories,
      through: :categorizations,
      class_name: 'Phoga::Category'

    has_many :custom_fields,
      class_name: 'Phoga::CustomField'
    accepts_nested_attributes_for :custom_fields,
      allow_destroy: true

    has_many :comments,
      as: :commentable,
      dependent: :destroy,
      class_name: 'Phoga::Comment'

    def reject_tagging(tagging_attr)
      tagging_attr['tag_id'].blank?
    end

    def reject_categorization(categorization_attr)
      categorization_attr['category_id'].blank?
    end
  end
end
