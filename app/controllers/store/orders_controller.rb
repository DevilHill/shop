class Store::OrdersController < ApplicationController
  layout 'order'
  before_action :require_user
  layout 'user_center' ,:only => 'show'
  def new
    pp "5555555555555555555555"
    pp Rails.public_path.to_s
    @user = current_user
    @addresses = @user.addresses
    @product = Product.find_by_id(params[:product_id])
    pp "111111111"
    #pp @product
    @order = Order.new
    pp @default_address = @user.default_address
    #@default_address = DefaultAddress.new
    #@default_address.user_id = 4
    #@default_address.address_id = 4
    #@default_address.save
  end
  def create
    @order = Order.new(param_order)
    @order.user_id = current_user.id
    if @order.save
      @order_product = OrderProduct.new
      @order_product.product_id = param_product_id[:product_id]
      pp param_product_id[:product_id]
      @order_product.order_id = @order.id
      @order_product.num = 1
      @order_product.save
      redirect_to store_order_path(@order.id)
    else
      render "new"
    end
  end
  def confirm_order
    @user = current_user
    @addresses = @user.addresses
    @default_address = @user.default_address
    @carts = Cart.where("user_id = ?",@user.id)
    @order = Order.new
  end
  def create_order
    @order = Order.new(param_order)
    @order.user_id = current_user.id
    if @order.save!
    @carts = Cart.where(:user_id =>current_user.id)
      @carts.each  do |cart|
        order_product = OrderProduct.new
        order_product.product_id = cart.product_id
        order_product.num = cart.num
        order_product.order_id = @order.id
          if order_product.save!
            cart.destroy
          end
      end
    redirect_to store_order_path(@order.id)
    else
      render 'confirm_order'
    end
  end
  def show

  end
  private
  def param_product_id
    params.require(:order).permit(:product_id)
  end
  def param_order
    params.require(:order).permit(:user_id,:address_id,:order_price,:status)
  end
end
