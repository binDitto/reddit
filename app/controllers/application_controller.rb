class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  helper_method :logged_in?, :current_user

  def current_user
    @logged_in_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "Dude! You gotta log in to do that! Log in!"
      redirect_to login_path
    end
  end
end
