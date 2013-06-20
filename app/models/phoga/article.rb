module Phoga
  class Article < ActiveRecord::Base
    attr_accessible :body, :title,
                    :published_at,
                    :user_id

    validates :user_id,
      presence: true

    belongs_to :user,
      class_name: 'Phoga::User'
  end
end
