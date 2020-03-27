class Admin::CommentsController < ApplicationController
  layout 'admin'
  before_action :require_administer
  def index
    if params[:product_id].blank?
      @comment = Comment.all
    else
      @product_id = params[:product_id]
      @comment = Comment.where(:product_id => @product_id)
    end
  end
  def new
    @comment = Comment.new
    @product_id = params[:product_id]
  end
  def create
    @comment = Comment.new(params[:comment])
    @product_id = @comment.product_id
    if @comment.save
      redirect_to admin_comments_path(:product_id => @product_id)
    else
      render 'new'
    end
  end
  def edit
    @comment = Comment.find_by_id(params[:id])
    @product_id = @comment.product_id
  end
  def update
    @comment = Comment.find_by_id(params[:id])
    @product_id = @comment.product_id
    @comment.update(params[:comment])
    pp "sssssssssss"
    pp session[:product_id]
    redirect_to admin_comments_path(:product_id => @product_id)
  end
  def destroy
    @comment = Comment.find_by_id(params[:id])
    @product_id = @comment.product_id
    @comment.destroy
    pp session[:product_id]
    redirect_to admin_comments_path(:product_id => @product_id)
  end
  def show
    @comment = Comment.find_by_id(params[:id])
  end
end
