class UsersController < ApplicationController
  def index

  end
  def show
       @user = User.find(params[:id])
       @information = Information.find(params[:id])
    if user_signed_in? && @information.user_id == current_user.id
      user = User.find(params[:id])
       @nickname = current_user.nickname
       @introduce = current_user.introduce
       @informations = current_user.informations
       @birthday = current_user.birthday
    else
      user = User.find(params[:id])
      @user_nickname = user.nickname
      @user_introduce = user.introduce
      @infos = user.informations
    end
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
  def search
    @user_or_information = params[:option]
    if @user_or_information == "1"
      @users = User.search(params[:keyword], @user_or_information)
    else
      @posts = Information.search(params[:keyword], @user_or_information)
    end
  end
 
  

  

  private 
   def user_params
    params.require(:user).permit(:surname, :name, :birthday, :prefecture_id, :organization, :introduce, :email, :encrypted_password)
   end
end
