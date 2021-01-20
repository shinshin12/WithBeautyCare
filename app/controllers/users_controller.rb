class UsersController < ApplicationController
  def index

  end
  def show
       @nickname = current_user.nickname
       @introduce = current_user.introduce
       @current_informations = current_user.informations
       @birthday = current_user.birthday
      @user = User.find(params[:id])
      @user_image = @user.image
      @user_nickname = @user.nickname
      @user_introduce = @user.introduce
      @infos = @user.informations
      @like_informations = @user.like_informations

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
