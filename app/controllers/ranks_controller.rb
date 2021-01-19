class RanksController < ApplicationController
  def index
    @rank_information = Information.order(impression_count: "DESC").limit(15)
    
  end
end
