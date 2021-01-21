class RanksController < ApplicationController

  def set
    @rank_information = Information.all
    @rank_information = Information.order(impression_count: "DESC").limit(10)
  end
  def put
    @like_information = Information.all
    @like_information = Information.includes(:liked_users).limit(10).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
  end
  def read
    @user_relations = User.all
    @user_relations = Relation.group(:followed_id).order('count(followed_id) DESC').limit(10)
  end
end
