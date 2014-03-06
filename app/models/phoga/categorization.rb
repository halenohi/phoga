module Phoga
  class Categorization < ActiveRecord::Base
    belongs_to :category,
      class_name: 'Phoga::Category'
    accepts_nested_attributes_for :category

    belongs_to :categorizable,
      polymorphic: true,
      class_name: 'Phoga::Categorization'

    belongs_to :article,
      foreign_key: :categorizable_id,
      class_name: 'Phoga::Article'

    validates :categorizable_type,
      presence: true
  end
end
