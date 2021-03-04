class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.add_favorite(micropost)
    flash[:success] = 'お気に入りに追加しました'
    redirect_to likes_user_path(current_user)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'お気に入りにから削除しました'
    redirect_to likes_user_path(current_user)
  end
end
