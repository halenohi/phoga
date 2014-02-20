module Phoga
  class CustomField < ActiveRecord::Base
    has_many :custom_field_assignments,
      dependent: :destroy

    has_many :assigned_articles,
      through: :custom_field_assignments,
      source: :article,
      conditions: "phoga_custom_field_assignments.assignable_type = 'Phoga::Article'"

    mount_uploader :image, Phoga::ImageUploader
  end
end
