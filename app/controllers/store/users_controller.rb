class Store::UsersController < ApplicationController
  layout 'user_center' ,:only => ['index','show','edit']
  def index
    @current_user = current_user
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to new_store_user_session_path
    else
      render 'new'
    end
  end
  def edit
    @current_user = current_user

   end
  def update
    @current_user = current_user
    pp params[:user]
    if @current_user.update(params[:user])
      redirect_to store_user_path(@current_user.id)
    else
      render 'edit'
    end
  end
  def show
    @current_user = current_user
  end
end
