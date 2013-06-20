module Phoga
  class Tag < ActiveRecord::Base
    attr_accessible :name

    has_many :taggings,
      dependent: :destroy

    has_many :tagged_articles,
      through: :taggings,
      source: :article,
      conditions: "phoga_taggings.taggable_type = 'Phoga::Article'"
  end
end
