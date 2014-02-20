# coding: utf-8
require 'carrierwave/processing/mime_types'

class Phoga::ApplicationUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes
  include CarrierWave::MiniMagick
  include Sprockets::Rails::Helper

  storage Rails.env.test? || Rails.env.development? ? :file : :fog

  def store_dir
    "uploads/#{ model.class.to_s.underscore }/#{ mounted_as }/#{ model.id }"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end
end
