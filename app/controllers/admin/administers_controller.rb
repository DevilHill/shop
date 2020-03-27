class Admin::AdministersController < ApplicationController
  before_action :require_administer
  layout "admin"
  def new
    @administer = Administer.new
  end
  def create
    @administer = Administer.new(params[:administer])
    pp "1111111111111111111111111"
    #pp administer_params
    pp params[:administer]
    if @administer.save
      redirect_to admin_administers_path
    else
      render 'new'
    end
  end
  def show

  end
  def index
    #@administer = Administer.all
    @administer = Administer.paginate( page:params[:page],per_page:5 )
  end

  def edit
    @administer = Administer.find_by_id(params[:id])
  end
  def update
    @administer = Administer.find_by_id(params[:id])
    pp "55555555555555555555"
    pp @administer
    if @administer.update(params[:administer])
      redirect_to admin_administers_path
    else
      render 'edit'
    end
  end
  def destroy
    @administer = Administer.find(params[:id])
    pp @administer
    pp "ddddddddddddddddddddddd"
    @administer.destroy
    redirect_to admin_administers_path
  end

  private
  def administer_params
    params.require(:administer).permit(:login ,:email,:password,:password_confirmation,:nickname)
  end
end
