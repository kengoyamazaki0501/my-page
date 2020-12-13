class UsersController < ApplicationController
  before_action :set_search
  def index
    @users = User.includes(:user)
    @mypages = Mypage.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @mypages = @user.mypages
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :gender, :introduction, :name, :facebook, :twitter, :instagram, :youtube)
  end
end
