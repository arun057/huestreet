# encoding: utf-8

class AssetUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  process :fix_exif_rotation
  process :strip

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :regular do
    process :resize_to_limit => [1024,768]
  end

  version :thumb do
   process :resize_to_limit => [200, 200]
  end

  version :map_thumb do
    process :resize_to_fill => [100,100]
  end

  version :home_thumb do
    process :resize_to_fill => [200, 200]
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  # 
  def filename
    if original_filename
      if model && model.read_attribute(mounted_as).present?
        model.read_attribute(mounted_as)
      else
        @name ||= "#{mounted_as}-#{uuid}.#{file.extension}"
      end
    end
  end

  protected

  def uuid
    UUID.state_file = false
    uuid = UUID.new
    uuid.generate
  end

  # Rotates the image based on the EXIF Orientation
  def fix_exif_rotation
    manipulate! do |img|
      img.auto_orient!
      img = yield(img) if block_given?
      img
    end
  end

  # Strips out all embedded information from the image
  def strip
    manipulate! do |img|
      img.strip!
      img = yield(img) if block_given?
      img
    end
  end

end
