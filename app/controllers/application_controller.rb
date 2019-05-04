class ApplicationController < ActionController::Base

    
    def log_in(user)
        session[:user_id] = user.id
    end

    # Remembers a user in a persistent session.
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    def current_user
        if session[:user_id]
          @current_user ||= User.find_by(id: session[:user_id])
        end
    end

end
