class UsersController < ApplicationController
  PER = 8
  def index
   
  end
  def show
       @nickname = current_user.nickname
       @introduce = current_user.introduce
       @current_informations = current_user.informations.page(params[:page]).per(PER).order('updated_at DESC')
       @birthday = current_user.birthday
      @user = User.find(params[:id])
      @user_image = @user.image
      @user_nickname = @user.nickname
      @user_introduce = @user.introduce
      @infos = @user.informations.page(params[:page]).per(PER).order('updated_at DESC')
      @like_informations = @user.like_informations.page(params[:page]).per(5).order('updated_at DESC')
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
    params.require(:user).permit(:surname, :name, :birthday, :prefecture_id, :organization, :introduce, :email, :encrypted_password, :image)
   end
end
