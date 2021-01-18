class LikesController < ApplicationController
  before_action :move_like
  def create
    user = current_user
    information = Information.find(params[:information_id])
    like = Like.create(user_id: user.id, information_id: information.id)
  end
  def destroy
    user = current_user
    information = Information.find(params[:information_id])
    like = Like.find_by(user_id: user.id, information_id: information.id)
    like.delete
  end

    private
  def move_like
    @information = Information.find(params[:information_id])
  end
end
