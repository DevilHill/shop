class Admin::ProductImagesController < ApplicationController
  layout 'admin'
  def index
    @product_id = params[:product_id]
    @product_image = ProductImage.where(:product_id => params[:product_id])
    pp "1111111111111111"
    pp @product_image.class
      #pp @product_image[4]
      #pp ProductImage.where(:product_id => @@product_id)
  end
  def new
    @image = ProductImage.new
    @product_id = params[:product_id]
  end
  def create
    @image = ProductImage.new
    pp @product_id = params[:product_image][:product_id]
    @photo = params[:product_image][:photo]
    filename = @photo.original_filename
    image_data = @photo.read
    filetime = Time.now.strftime("%Y%m%d%H%M%S")
    filetype = filename.split(".")[1]
    pp @newfilename = filename.split(".")[0] + filetime + "." + filetype

    @image.photo = @newfilename
    @image.product_id = @product_id
    if @image.save!
      File.open("#{Rails.root}/public/product_image/"+@newfilename,"wb") do |f|
        f.write(image_data)
      end

      #@image.save!
      #flash[:notice] = "成功"
      redirect_to admin_product_images_path(:product_id => @product_id)
    else
      render 'new'
    end
  end
  def destroy
    @image = ProductImage.find_by_id(params[:id])
    @product_id = @image.product_id
    pp params[:id]
    pp "1111111111111111"
    pp @image
    #root = Rails.root.to_s + "/public"
    root = Rails.public_path.to_s + "/product_image/" + @image.photo
    pp Rails.public_path.to_s
    pp root

    @image.destroy
      FileUtils.rm(root)
    redirect_to admin_product_images_path(:product_id => @product_id)
  end
  #def my_store
  #  image = PhotoUploader.new
  #  image.store!(params[:photo])
  #end
  #def remove_store
  #
  #end
end
