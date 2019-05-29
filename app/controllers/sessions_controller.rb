class SessionsController < ApplicationController

  def create
    if params[:user]
      user = User.find_by_email(params[:user][:email])
      if user
        log_in(user)
      else
        flash.now[:danger] = 'Invalid email'
        render 'New'
      end
    end
  end

  def destroy
    log_out if logged_in?
  end

end
