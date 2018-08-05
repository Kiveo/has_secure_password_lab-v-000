class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user.create(username: params[:username], password: params[:password])
    session[:username] = @user.username 
    redirect '/' #welcome page
  end

end 
