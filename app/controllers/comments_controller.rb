class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to mypage_path(@comment.mypage) 
    else  
      @mypage = @comment.mypage
      @comments = @mypage.comments
      render "mypages/show" 
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, mypage_id: params[:mypage_id])
  end
end
