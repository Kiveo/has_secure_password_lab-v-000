class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user.create(username: params[:username], password: params[:password])
    session[:user_id] = @user.id #apply a session id
    redirect '/' #welcome page
  end

end
