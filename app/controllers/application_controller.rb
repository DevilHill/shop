class ApplicationController < ActionController::Base
  helper_method :current_administer_session,:current_administer

  before_action :premit_params

  def premit_params
    params.permit!
  end

  def require_administer
    unless current_administer
      store_location
      redirect_to admin_login_url
      return false
    end
  end

  def require_user
    unless current_user
      store_location
      redirect_to store_login_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.url
  end
  private
  def current_administer_session
    return @current_administer_session if defined?(@current_administer_session)
    @current_administer_session = AdministerSession.find
  end
  def current_administer
    return @current_administer if defined?(@current_administer)
    @current_administer = current_administer_session && current_administer_session.administer
  end
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session &&current_user_session.user
  end

end
