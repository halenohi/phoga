module Phoga
  class Categorization < ActiveRecord::Base
    belongs_to :category

    belongs_to :categorizable,
      polymorphic: true

    belongs_to :article,
      class_name: 'Phoga::Article',
      foreign_key: :categorizable_id
  end
end
