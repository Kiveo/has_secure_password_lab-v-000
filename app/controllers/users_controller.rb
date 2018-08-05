class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(name: params[:name], password: params[:password])
    flash[:notice] = "Successfully signed up!"
    redirect_to '/' #welcome page
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
