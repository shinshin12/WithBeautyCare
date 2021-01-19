class InformationsController < ApplicationController
  impressionist action: [:index, :show] 
  def index
    @informations = Information.all
    impressionist(@information, nil, unique: [:session_hash])
  end
  def new
    @information = Information.new
  end
  def create
    @information = Information.new(information_params)
    if @information.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
      @information = Information.find(params[:id])
      @comment = Comment.new
      @comments = @information.comments.includes(:user)
      impressionist(@information,nil, unique: [:session_hash])
  end
  def edit
   @information = Information.find(params[:id])
  end
  def update
   @information = Information.find(params[:id])
    if @information.update(information_params)
      redirect_to information_path
    else
      render :edit
    end
  end
  def destroy
    @information = Information.find(params[:id])
     if @information.destroy
      redirect_to root_path
     else
      render :show
     end
  end
  
  private
    def information_params
      params.require(:information).permit(:title, :sentence, :image, :tag_id).merge(user_id: current_user.id)
    end
end
