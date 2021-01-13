class InformationsController < ApplicationController
  def index
   @informations = Information.includes(:user)
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
