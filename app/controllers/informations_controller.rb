class InformationsController < ApplicationController
  impressionist actions: [:index, :show]
  PER = 15
  def index
    @informations = Information.all
    @informations = Information.order(updated_at: "DESC").page(params[:page]).per(PER)
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
      impressionist(@information, nil, unique: [:session_hash])
      @comment = Comment.new
      @comments = @information.comments.includes(:user)
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
  def search
    @informations = Information.search(params[:keyword])
  end
  
  private
    def information_params
      params.require(:information).permit(:title, :sentence, :image, tag_ids: []).merge(user_id: current_user.id)
    end
end
