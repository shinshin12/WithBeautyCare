class CommentsController < ApplicationController

  def create
     @comments = Comment.create(comment_params)
     redirect_to information_path(@comments.information.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, information_id: params[:information_id])
  end
end
