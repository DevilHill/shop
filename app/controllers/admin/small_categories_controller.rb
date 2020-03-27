class Admin::SmallCategoriesController < ApplicationController
  before_action :require_administer
  layout "admin"
  def index
    @small_category = SmallCategory.all
    @small_category = SmallCategory.paginate( page:params[:page],per_page:5 )
  end
  def new
    @small_category = SmallCategory.new
  end
  def create
    @small_category = SmallCategory.new(params[:small_category])
    if @small_category.save
    flash[:notice] = "添加成功!"
      redirect_to admin_small_categories_path
    else
      render "new"
    end
  end
  def edit
    @small_category = SmallCategory.find_by_id(params[:id])
  end
  def update
    @small_category = SmallCategory.find_by_id(params[:id])
    if @small_category.update(params[:small_category])
      flash[:notice] = "修改成功!"
      redirect_to admin_small_categories_path
    else
      render "edit"
    end
  end
  def destroy
    @small_category = SmallCategory.find_by_id(params[:id])
    if @small_category.destroy
      flash[:notice] = "删除成功!"
    else
      flash[:notice] = "删除失败!"
    end
  end
end
