# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog

  process resize_to_fill: [300, 300]

  def extension_white_list
     %w(jpg jpeg gif png)
  end

end
