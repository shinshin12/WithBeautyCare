class RanksController < ApplicationController
  def index
    @rank_information = Information.order(impression_count: "DESC").limit(15)
    @like_information = Information.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}.limit(15)
  end
end
