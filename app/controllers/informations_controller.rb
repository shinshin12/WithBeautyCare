class InformationsController < ApplicationController
  def index
   @information = Information.all
  end
  def new
    @information = Information.new
  end
end
