class Admin::OrderProductsController < ApplicationController
  layout 'admin'
  before_action :require_administer
  def new
    @order_product = OrderProduct.new
    @order_id = params[:order_id]
    pp params[:order_id]
  end
  def create
    @order_product = OrderProduct.new(params[:order_product])
    @order_id = @order_product.order_id
    if @order_product.save
      redirect_to admin_order_path(@order_id)
    else
      render "new"
    end
  end
  def edit

  end
  def update

  end
end
