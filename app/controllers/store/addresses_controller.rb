class Store::AddressesController < ApplicationController
  layout 'user_center'
  def index
    @current_user = current_user
    @addresses = Address.where(:user_id => current_user.id)
  end
  def new
    @current_user = current_user
    @address = Address.new
  end
  def create
    @address = Address.new(params[:address])
    pp "wwwwwwwwwwwww"
    pp @user_id
    if @address.save
      redirect_to store_addresses_path
    else
      render "new"
    end
  end
  def edit

  end
  def show

  end

  def destroy
    @address = Address.find_by_id(params[:id])
    @address.destroy
    redirect_to store_addresses_path
  end
end
