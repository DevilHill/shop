class Admin::UsersController < ApplicationController
  before_action :require_administer
  layout "admin"

  def index
    #@user = User.all
    @user = User.paginate( page:params[:page],per_page:5 )
      #pp @user
  end
  def new
    @user = User.new
  end
  def edit
    @user = User.find_by_id(params[:id])
    pp "2222222222"
    pp @user
    pp params[:id]
    if @user.blank?
      redirect_to :action => "index"
    end

  end
  def update
    @user = User.find_by_id(params[:id])
    if @user.update(params[:user])
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end
  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to admin_users_path
    else
      render 'new'
    end
  end
  def show
    @user = User.find_by_id(params[:id])
    @user_id = params[:id]
    @address = @user.addresses
    pp "111"
    pp @current_administer_session

  end
end
