class InformationsController < ApplicationController
  def index
  
  end
  def new
    @information = Information.new
  end
end
