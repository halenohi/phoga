module Phoga
  class CustomField < ActiveRecord::Base
    belongs_to :article,
      class_name: 'Phoga::Article'

    validates :name,
      presence: true

    mount_uploader :image, Phoga::ImageUploader
  end
end
