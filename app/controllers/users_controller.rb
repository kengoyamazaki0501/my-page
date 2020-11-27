class UsersController < ApplicationController
  # before_action :authenticate_user!, only [:show]

  def index
    @users = User.includes(:user)
  end

  def show
    @user = User.find(params[:id])
  end



  private
  def user_params
    params.require(:user).permit(:email, :password, :gender, :introduction)
  end
  
end
