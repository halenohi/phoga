module Phoga
  class Tagging < ActiveRecord::Base
    attr_accessible :tag_id, :taggable_id, :taggable_type

    belongs_to :tag

    belongs_to :taggable,
      polymorphic: true

    belongs_to :article,
      class_name: 'Phoga::Article',
      foreign_key: 'taggable_id'
  end
end
