class UsersController < ApplicationController
  
  def show
    @user = User.find_by(id: params[:id])
      
    @upcoming_events = current_user.upcoming_events
    @previous_events = current_user.previous_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:info] = "Account Created Successfully"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def signin
    if params[:user]
      user = User.find(params[:user][:id])
      if user
        log_in(user)
        redirect_to user
      end
    end
  end

  def signout
    log_out if logged_in?
    redirect_to root_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
