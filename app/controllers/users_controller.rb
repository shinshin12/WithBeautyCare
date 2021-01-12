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
  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private 
   def user_params
    params.require(:user).permit(:surname, :name, :birthday, :prefecture, :organization, :introduce, :email, :encrypted_password)
   end

end
