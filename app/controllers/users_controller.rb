# The User controller is responsible for all user-related methods.
class UsersController < ApplicationController


    #def user_params
        #params.require(:user).permit(:name, :email, :gold, :currentPlotSelected)
    #end
    
    def show
        @user = User.find(params[:id])
    end
    
    def new
        @user = User.new
    end
    
    def id
        id = params[:id] # retrieve ID from URI route
        @user = User.find(id) # look up by unique ID
    end

    def index
        @users = User.all
    end
    
    def login
        
    end
    
    def check_for_email_in_use(email)
        User.exists?(email: email.downcase)
    end
    
    def create
        
        # Check for email in use
        if !check_for_email_in_use(params[:user][:email])
        
            # Check for new password & new password confirmation mismatch
            if params[:user] [:password] == params[:user] [:password_confirmation]
                params[:user].delete :password_confirmation
                @user = User.new(user_params)
                
                # Attempt to save the user in the DB
                if @user.save
                    # Handle a successful save
                    flash[:notice] = 'Successfully created new user!'
                    redirect_to login_path
                else
                    # Handle an unsuccessful save
                    render 'new'
                end
            else
                # Handle a "new password & new password confirmation mismatch"
                @user = User.new
                flash[:notice] = 'Passwords do not match'
                render 'new'
            end
        else
            # Handle an "email in use"
            @user = User.new
            flash[:notice] = 'Email already in use!'
            render 'new'
        end
    end
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :gold, :currentPlotSelected,
                                   :password_confirmation)
    end
  
end
