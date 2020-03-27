class Store::UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  def create
    @user_session = UserSession.new(user_session_params.to_h)
    pp "sssssssssssssss"
    if @user_session.save
      pp "2222222"
      redirect_to store_homes_path
    else
      pp "111111111"
      render "new"
    end
  end
  def destroy
    current_user_session.destroy
    redirect_to new_store_user_session_path
  end
  def user_session_params
    params.require(:user_session).permit(:login ,:password)
  end
end
