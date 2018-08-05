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
  # def create
  #   @user = User.find_by(name: params[:name])
  #   if @user && @user.authenticate(params[:password])
  #     session[:user_id] = @user.id
  #     redirect_to "/" #home page
  #   else
  #     flash[:notice] = "Incorrect Login Info"
  #     redirect_to new_user_path
  #   end
  #  end
# ---------------------------
def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    @user = user
    session[:user_id] = @user.id
    redirect_to '/'
end
# -----------------------
  def delete
    session.delete :user_id
  end

end
