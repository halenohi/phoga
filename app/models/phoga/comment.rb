module Phoga
  class Comment < ActiveRecord::Base
    belongs_to :commentable,
      polymorphic: true

    def publish!
      self.published_at = Time.now
      self.save!
      self
    end
  end
end
