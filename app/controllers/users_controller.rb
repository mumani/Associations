class UsersController < ApplicationController
  
  def show
    if params[:id].nil?
      @user = User.find_by(id: session[:user_id])
    else
      @user = User.find(params[:id])
    end
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
        p user
        log_in(user)
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
