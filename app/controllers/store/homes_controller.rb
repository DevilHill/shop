class Store::HomesController < ApplicationController
  layout 'store_index',:only => ['index','search','show',]
  before_action :require_user,:only => ['add_favorite','del_favorite']
  def index
    @product = Product.all
    @current_user = current_user
    unless @current_user.blank?
      @favorite = @current_user.favorites
    end
    pp "22222222222222222"
    #pp @favorite.find_by_product_id(1)
  end
  def show
    @product = Product.where(:small_category_id => params[:id])
    pp "44444444444444444"
    pp @current_user = current_user
  end
  def search
    pp @q = params[:q]
    q = "%" + params[:q] + "%"
    pp q
    @product = Product.where("name like ? or note like ?",q,q)
    pp "111111111111111111"
    pp @product
  end
  def add_favorite
    pp "111111111111111"
    @favorite = Favorite.new
    @favorite.user_id = params[:user_id]
    @favorite.product_id = params[:product_id]
    pp @favorite
    @favorite.save
    @favorite_id = params[:favorite_id]
  end
  def del_favorite
    pp "3333333333333333333333333"
    @favorite = Favorite.where("product_id = ? and user_id = ?",params[:product_id],params[:user_id])
    pp @favorite
    @favorite[0].destroy
    @favorite_id = params[:favorite_id]
  end
end
