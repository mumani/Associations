class SessionsController < ApplicationController

  def create
    if params[:user]
      user = User.find(params[:user][:id])
      if user
        log_in(user)
        redirect_to user
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
