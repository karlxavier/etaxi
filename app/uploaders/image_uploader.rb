class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # def default_url
  #   # 'default_profile_resto.png' #rails will look at 'app/assets/images/default_avatar.png'
  # end

  # version :web do
  #   version :thumb    { process :resize_to_fit => [32, 32] }
  #   version :preview  { process :resize_to_fit => [128, 128] }
  #   version :full     { process :resize_to_fit => [1024, 768] }
  # end

  version :web do
    process resize_to_fill: [295, 90]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
