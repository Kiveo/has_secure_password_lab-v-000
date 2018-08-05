class SessionsController < ApplicationController

 def new
   if !logged_in?
     render 'sessions/new'
   else
     redirect_to '/'
   end
 end

 get '/login' do
   if !logged_in?
     erb :'users/login'
   else
     redirect to '/'
   end
 end

 def create
 end

 def delete
   session.delete :user_id
 end

end
