class UsersController < ApplicationController
  before_action :require_admin, only: [:index]
  def index
    @users = User.all
  end

  def show
    @user = current_user
    if @user.privilege == 0
      @role = 'User'
    elsif @user.privilege == 1
      @role = 'Designer'
    else @user.privilege == 2
      @role = 'Admin'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_update_params)
      redirect_to profile_path
    else
      redirect_to edit_path
    end
  end

  def new
    @user = User.new
    @privilege = 0
  end

  def create
    @user = User.new(user_signup_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/join'
    end
  end

  private def user_signup_params
    params.require(:user).permit(:username, :email, :password, :privilege)
  end

  private def user_update_params
    params.require(:user).permit(:username, :email)
  end
end
