class Admin::CategoriesController < ApplicationController
  layout 'admin'
  before_action :require_administer
  before_action :find_category, :only => [:show,:edit]
  def index
    #@category = Category.all
    @category = Category.paginate( page:params[:page],per_page:5 )
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "添加成功"
      redirect_to admin_categories_path
    else
      render "new"
    end
  end
  def destroy
    @category = Category.find_by_id(params[:id])
    if @category.destroy
      redirect_to admin_categories_path
      flash[:notice] = "删除成功!"
    else
      flash[:notice] = "删除失败!"
    end
  end
  def edit
    @category = Category.find_by_id(params[:id])
  end
  def update
    @category = Category.find_by_id(params[:id])
    if @category.update(params[:category])
      flash[:notice] = "修改成功"
      redirect_to admin_categories_path
    else
      render 'edit'
    end
  end
  def show
    @category = Category.find_by_id(params[:id])
    $category_id = params[:id]
    @small_category = @category.small_categories
  end
  def find_category
    @category = Category.find_by_id(:id)
    unless @category.blank?
      redirect_to :action => "index"
    end
  end
end
