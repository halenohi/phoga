module Phoga
  class Category < ActiveRecord::Base
    has_many :categorizations,
      dependent: :destroy

    has_many :categorized_articles,
      -> { where({ categorizable_type: 'Phoga::Article' }) },
      through: :categorizations,
      source: :article

    belongs_to :parent,
      class_name: 'Phoga::Category',
      foreign_key: 'parent_id'

    has_many :children,
      class_name: 'Phoga::Category',
      foreign_key: 'parent_id'
  end
end
