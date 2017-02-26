class SessionsController < ApplicationController
  def login
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome on board #{user.username}!"
      redirect_to root_path
    else
      flash.now[:danger] = "Are you sure you signed up?"
      render 'login'
    end

  end

  def logout
    session[:user_id] = nil
    flash[:danger] = "You are logged out man. See ya laterz."
    redirect_to login_path
  end
end
