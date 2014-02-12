module Phoga
  class Categorization < ActiveRecord::Base
    attr_accessible :categorizable_id, :categorizable_type, :category_id

    belongs_to :category

    belongs_to :categorizable,
      polymorphic: true

    belongs_to :article,
      class_name: 'Phoga::Article',
      foreign_key: :categorizable_id
  end
end
