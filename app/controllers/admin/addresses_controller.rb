class Admin::AddressesController < ApplicationController
  layout 'admin'
  before_action :require_administer
  def new
    @address = Address.new
    pp "1111111111111111"
    pp params[:user_id]
    @user_id = params[:user_id]
  end
  def create
    @address = Address.new(params[:address])
    @user_id = @address.user_id
    pp "wwwwwwwwwwwww"
    pp @user_id
    if @address.save
      redirect_to admin_user_path(@user_id)
    else
      render "new"
    end
  end
  def edit
    @address = Address.find_by_id(params[:id])
  end
  def update
    @address = Address.find_by_id(params[:id])
    @user_id = @address.user_id
    @address.update(params[:address])
    redirect_to admin_user_path(@user_id)
  end
  def destroy
    @address = Address.find_by_id(params[:id])
    @user_id = @address.user_id
    @address.destroy
    redirect_to admin_user_path(@user_id)
  end
end
