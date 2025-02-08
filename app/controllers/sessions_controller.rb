class SessionsController < ApplicationController
  before_action :redirect_logged_in_user, only: [:new, :create]

  def new
  end
  
  def create
    user = User.find_by(username: params[:username_or_email])

    user = User.find_by(email: params[:username_or_email]) if !user
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You have successfully logged in."
      redirect_to root_path
    else
      flash.now[:error] = "User credentials do not match."
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
  end

  private

  def redirect_logged_in_user
    if logged_in
      flash[:error] = "You are already logged in."
      redirect_to root_path
    end
  end

end
