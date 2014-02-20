module Phoga
  class Category < ActiveRecord::Base
    has_many :categorizations,
      dependent: :destroy

    has_many :categorized_articles,
      through: :categorizations,
      source: :article,
      conditions: "phoga_categorizations.categorizable_type = 'Phoga::Article'"

    belongs_to :parent,
      class_name: 'Phoga::Category',
      foreign_key: 'parent_id'

    has_many :children,
      class_name: 'Phoga::Category',
      foreign_key: 'parent_id'
  end
end
