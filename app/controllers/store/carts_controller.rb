class Store::CartsController < ApplicationController
  before_action :require_user
  def index
    @user = current_user
    @carts = Cart.where("user_id = ?",@user.id)
  end
  def destroy
    @cart = Cart.find_by_id(params[:id])
    @cart.destroy
    redirect_to store_carts_path
  end
  def add_cart
    pp "11111111111111111111111111111"
    pp params[:product_id]
    @current_user = current_user
    pp @carts = Cart.where("product_id = ? and user_id = ?",params[:product_id],@current_user.id)
    if @carts.blank?
      @cart = Cart.new
      @cart.product_id = params[:product_id]
      @cart.user_id = @current_user.id
      @cart.num = 1
      @cart.save
      pp "2222222222222222"
    else
      @cart = Cart.where("product_id = ? and user_id = ?",params[:product_id],@current_user.id)
      pp num =  @cart[0].num
      @cart[0].num = num + 1
      @cart[0].save
      pp "333333333333333"
    end
  end
  def add_num
    @cart = Cart.find_by_id(params[:id])
    @cart.num = params[:num]
    @cart.save
  end
  def sub_num
    @cart = Cart.find_by_id(params[:id])
    @cart.num = params[:num]
    @cart.save
  end
end
