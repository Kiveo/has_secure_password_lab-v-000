class SessionsController < ApplicationController

 def new 
 end 

 def create 
 end 

 def delete 
   session.delete :user_id
 end

end