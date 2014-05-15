require 'cgi'

module Phoga
  class Tag < ActiveRecord::Base
    before_save :url_encode

    has_many :taggings,
      dependent: :destroy

    has_many :tagged_articles,
      through: :taggings,
      source: :article

    private
      def url_encode
        self.slug = CGI.escape self.slug
      end
  end
end
