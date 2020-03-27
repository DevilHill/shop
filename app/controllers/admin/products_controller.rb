class Admin::ProductsController < ApplicationController
  layout 'admin'
  before_action :require_administer
  helper_method :up_down
  def index
    @product = Product.paginate( page:params[:page],per_page:5 )
  end
  def new
    @product = Product.new
    @image = ProductImage.new
  end
  def create
    @product =Product.new
    @image = ProductImage.new
    @product.name = params[:product][:name]
    @product.note = params[:product][:note]
    @product.price = params[:product][:price]
    @product.small_category_id = params[:product][:small_category_id]
    if @product.save
      @image.product_id = @product.id
      pp "iiiiiiiiiiiiii"
      pp @image.photo = params[:product_hidden_image]
      @image.save!
      FileUtils.cp("#{Rails.root}/public/tmp_images/"+params[:product_hidden_image],"#{Rails.root}/public/product_image/"+params[:product_hidden_image])
      redirect_to admin_products_path
    else
      render 'new'
    end
  end
  def edit
    @product = Product.find_by_id(params[:id])
  end
  def update
    @product = Product.find_by_id(params[:id])
    if @product.update(params[:product])
      redirect_to admin_products_path
    else
      render "edit"
    end
  end
  def destroy
    @product = Product.find_by_id(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end
  def up_down
    @product = Product.find_by_id(params[:id])
    if @product.status == 1
      @product.status = 2
      @product.save
      redirect_to admin_products_path
    else
      @product.status = 1
      @product.save
      redirect_to admin_products_path
    end
  end
  def get_options
    #options = ""
    #small_category = Category.find_by_id(params[:id]).small_category
    #small_category.each do |s|
    #  options << "<option value=#{s.id}>#{s.small_title}</option>"
    #end
    #render :text => options
    pp @small_cates = SmallCategory.where(["category_id = ?", params[:big_cate_id]])
    pp "ddddd"
  end
  def upimages
    pp "文件上传成功"
    @tmp_image = params[:file]
    pp @tmp_image.size
    pp filename = @tmp_image.original_filename
    image_data = @tmp_image.read
    filetime = Time.now.strftime("%Y%m%d%H%M%S")
    filetype = filename.split(".")[1]
    pp @newfilename = filename.split(".")[0] + filetime + "." + filetype
    File.open("#{Rails.root}/public/tmp_images/"+@newfilename,"wb") do |f|
      f.write(image_data)
    end
  end
  private
  def params_product
    params.require(:product).permit(:name, :note,:price,:small_category_id)
  end
  def params_photo
    params.require(:product).permit(:photo)
  end
end
