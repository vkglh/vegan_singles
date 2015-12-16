# encoding: utf-8

class GalleryTwoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog

  process resize_to_fill: [960, 750]

  def extension_white_list
     %w(jpg jpeg gif png)
  end

end
