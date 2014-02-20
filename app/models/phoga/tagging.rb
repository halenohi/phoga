module Phoga
  class Tagging < ActiveRecord::Base
    belongs_to :tag

    belongs_to :taggable,
      polymorphic: true

    belongs_to :article,
      class_name: 'Phoga::Article',
      foreign_key: 'taggable_id'
  end
end
