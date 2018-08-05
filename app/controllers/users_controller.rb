class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user.create(username: params[:username], password: params[:password])
    flash[:notice] = "Successfully signed up!"
    redirect '/' #welcome page
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
