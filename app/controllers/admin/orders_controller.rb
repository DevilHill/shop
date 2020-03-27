class Admin::OrdersController < ApplicationController
  layout 'admin'
  before_action :require_administer
  def index
    @order = Order.all
  end
  def new
    @order = Order.new
  end
  def create
    @order = Order.new(params[:order])
    pp "111111111111111"
    pp @order
    if @order.save
      redirect_to admin_orders_path
    else
      render "new"
    end
  end
  def edit
    @order = Order.find_by_id(params[:id])
  end
  def update
    @order = Order.find_by_id(params[:id])
    pp "wwwwwwwwwwwwwwwwwwwwwwwwww"
    #pp @order.user_id
    #@address = Address.where(:user_id => @order.user_id)
    #pp @address.to_a
    if @order.update(params[:order])
      redirect_to admin_orders_path
    else
      render 'edit'
    end
  end
  def destroy
    @order = Order.find_by_id(params[:id])
    @order.destroy
    redirect_to admin_orders_path
  end
  def show
    @order_product = OrderProduct.where(:order_id => params[:id] )
    pp @order
  end
  def get_address
    pp "11111111111111111"
    pp @address = Address.find_by_id(params[:id])
    #class Add
    #  id
    #  address
    #end
    #aa = Add.new()
    #@address.each do |a|
    #
    #end
  end
end
