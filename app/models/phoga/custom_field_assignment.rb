module Phoga
  class CustomFieldAssignment < ActiveRecord::Base
    attr_accessible :assignable_id, :assignable_type, :custom_field_id

    belongs_to :custom_field

    belongs_to :assignable,
      polymorphic: true

    belongs_to :article,
      class_name: 'Phoga::Article',
      foreign_key: 'assignable_id'
  end
end
