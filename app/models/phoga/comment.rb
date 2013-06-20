module Phoga
  class Comment < ActiveRecord::Base
    attr_accessible :author_name, :author_email, :body,
                    :commentable_id, :commentable_type, :published_at, :reply_to_id

    belongs_to :commentable,
      polymorphic: true

    def publish!
      self.published_at = Time.now
      self.save!
      self
    end
  end
end
