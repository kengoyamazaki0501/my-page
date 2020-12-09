class RelationshipsController < ApplicationController
  def follow
    current_user.follow(params[:id])
    redirect_to mypage_path(id: params[:mypage_id])
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_to mypage_path(id: params[:mypage_id])
  end
end
