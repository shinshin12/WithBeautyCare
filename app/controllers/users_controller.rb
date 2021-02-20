class UsersController < ApplicationController
  before_action :move_action, only: [:edit,:update]
  before_action :authenticate_user!, except: [:index,:show]

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
   @nickname = current_user.nickname
  end
  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end
 
  private 
   def move_action
    @user = User.find(current_user.id)
   end
   def user_params
    params.require(:user).permit(:surname, :name, :nickname, :birthday, :prefecture, :organization, :introduce, :email, :image, :city, :address, :postal_code)
   end
   def move_index
      unless user_signed_in? && current_user.id == @user_id
        redirect_to root_path
      end
   end
end
