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
      allow_destroy: true

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

    # after_initialize :set_default_categorization
    # before_save :clean_categorizations

    def set_default_categorization
      if self.categorizations.empty?
        self.categorizations.build
      end
    end

    def reject_categorization(categorization_attr)
      categorization_attr['category_id'].blank?
    end
  end
end
