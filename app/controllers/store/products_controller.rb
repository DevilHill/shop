class Store::ProductsController < ApplicationController
  layout "product_detail"
  def index
    @product = Product.find_by_id(params[:product_id])
    @image = ProductImage.where(:product_id => @product.id)
    @comments = Comment.where(:product_id => @product.id)
    @current_user = current_user
    #pp @comments
    #pp @image
    #pp "11111111"
    #pp @product
  end
  def show

  end
end
