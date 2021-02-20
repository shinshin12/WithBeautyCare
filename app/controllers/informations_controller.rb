class InformationsController < ApplicationController
  before_action :move_action only: [:show,:edit,:update,:destroy]
  before_action :authenticate_user!, except: [:index,:show,:search]
  before_action :move_index, only: [:edit,:update,:destroy]
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
      @latitude = @information.latitude
      @longitude = @information.longitude
      impressionist(@information, nil, unique: [:session_hash])
      @comment = Comment.new
      @comments = @information.comments.includes(:user)
  end
  def edit
  end
  def update
    if @information.update(information_params)
      redirect_to information_path
    else
      render :edit
    end
  end
  def destroy
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
    def move_action
      @information = Information.find(params[:id])
    end
    def information_params
      params.require(:information).permit(:title, :sentence, :image, :tag_id, :address, :postal_code).merge(user_id: current_user.id)
    end
    def move_index
      unless user_signed_in? && current_user.id == @information.user_id
        redirect_to root_path
    end
end
