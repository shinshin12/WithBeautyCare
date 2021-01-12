class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @image = current_user.image
    @nickname = current_user.nickname
    @informations = current_user.informations
  end
  def edit
   @user = User.find(current_user.id)
   @nickname = current_user.nickname
  end

end
