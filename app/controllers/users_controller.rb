class UsersController < ApplicationController
  def new
  end
  
  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Your account was successfully created."
      redirect_to root_path
    else
      flash[:error] = "User credentials are not valid."
      render :new
    end

  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
