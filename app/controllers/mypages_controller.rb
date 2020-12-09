class MypagesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @mypage = Mypage.includes(:user)
  end

  def show
    @mypage = Mypage.find(params[:id])
    @comment = Comment.new
    @comments = @mypage.comments.includes(:user)
  end

  def new
    @mypage = Mypage.new
  end

  def create
    @mypage = Mypage.new(mypage_params)
    if @mypage.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @mypage = Mypage.find(params[:id])
    redirect_to root_path unless user_signed_in? && current_user.id == @mypage.user_id
  end

  def update
    @mypage = Mypage.find(params[:id])
    if @mypage.update(mypage_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    mypage = Mypage.find(params[:id])
    mypage.destroy
    redirect_to root_path
  end

  def search
    @search = Mypage.ransack(params[:q])
    @mypages = @search.result
  end

  private

  def mypage_params
    params.require(:mypage).permit(:title, :catch_copy, :concept, :image, :movie).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
