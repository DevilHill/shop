class Admin::AdministerSessionsController < ApplicationController
  def new
    pp "newwwwwwwww"
    @administer_session = AdministerSession.new
  end
  def create
    pp "ssssssss"
    @administer_session = AdministerSession.new(administer_session_params.to_h)
    if @administer_session.save
      redirect_to admin_administers_path
    else
      render 'new'
    end
  end
  def destroy
    current_administer_session.destroy
    redirect_to new_admin_administer_session_path
  end
  private
  def administer_session_params
    params.require(:administer_session).permit(:login ,:password)
  end
end
