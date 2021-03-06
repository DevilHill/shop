class PhotoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  #include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "images/products/"
  end
  #class MyUploader < CarrierWave::Uploader::Base
    def cache_dir
    '/tmp/photo-cache'
  end
  #end
  # Provide a default URL as a default if there hasn't been a file uploaded:
   def default_url(*args)
     # For Rails 3.1+ asset pipeline compatibility:
     # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))

     "/images/fallback/" + [version_name, "default.png"].compact.join('_')
   end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end
  # 设定上传的版本
   process resize_to_fit: [800, 800]
  # 生成缩略图的版本
  #version :thumb do
  # process resize_to_fill: [200,200]
  #end
  #上传文件仅支持图像
  #  def content_type_whitelist
  #    /image\//
  #  end
  # Create different versions of your uploaded files:
  # version :thumb do
  #  process resize_to_fit: [200, 200]
  # end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  #def extension_whitelist
  #   %w(jpg jpeg gif png)
  #end
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "#{Time.now.strftime("%Y%m%d%H%M%S")}-" + original_filename
   end
end
