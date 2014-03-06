module Phoga
  class Tag < ActiveRecord::Base
    has_many :taggings,
      dependent: :destroy

    has_many :tagged_articles,
      through: :taggings,
      source: :article
  end
end
