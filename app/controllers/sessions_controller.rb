# The Sessions controller is responsible for all session-related methods.
class SessionsController < ApplicationController
  def new
    end
  
    def verifyLogin(user)
        user[:password] == params[:session][:password]
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && verifyLogin(user)
            flash[:notice] = "User Logged In! Welcome!"
            redirect_to plots_path
        else
            # Display message if username and/or password is incorrect
            flash[:notice] = "Invalid email/password combination"
            redirect_to login_path
            #render 'new'
        end
    end
        

    def destroy
        
    end  
end