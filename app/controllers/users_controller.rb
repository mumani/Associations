class UsersController < ApplicationController
  
  def show
    @user = User.find_by(id: params[:id])
      
    @upcoming_events = current_user.upcoming_events_to_attend
    @previous_events = current_user.previous_attended_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:info] = "Account Created Successfully"
      log_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
