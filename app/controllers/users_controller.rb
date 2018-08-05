class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user.create(username: params[:username], password: params[:password])
    session[:user_id] = @user.id #apply a session id
    redirect '/' #welcome page
  end

  private 

  def user_params 
    params.require(:user).permit(:username, :password)
  end 
  
end
