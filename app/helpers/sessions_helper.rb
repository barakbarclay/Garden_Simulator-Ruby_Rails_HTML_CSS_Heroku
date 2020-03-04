module SessionsHelper
    # Logs in the user info
    def log_in(user)
        session[:user_id] = user.id
    end
    
    # Returns user who's logged in (if any user is logged in)
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end
    
    # Returns bool state of if a user is logged in
    def logged_in?
        !current_user.nil?
    end
end
