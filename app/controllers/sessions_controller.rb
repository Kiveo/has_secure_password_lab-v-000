class SessionsController < ApplicationController
#login page
 def new
   if !logged_in?
     render 'sessions/new'
   else
     redirect_to '/'
   end
 end

  # Log In action
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{current_user.slug}"
    else
      flash[:notice] = "Incorrect Login Info"
      redirect_to 'sessions/new'
    end
   end

 def delete
   session.delete :user_id
 end

end
