class HomeController < ApplicationController
  def index
  
  end
  def search
    @informations = Information.search(params[:keyword])
  end
  
end
