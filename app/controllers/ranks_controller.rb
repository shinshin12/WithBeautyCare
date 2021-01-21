class RanksController < ApplicationController


  def set
    @rank_information = Information.all
    @rank_information = Information.order(impression_count: "DESC")
  end
  def put
    @like_information = Information.all
    @like_information = Information.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
  end
  def read
    @user = User.all
    @user_relations = Relation.group(:followed_id).order('count(followed_id) DESC')
  end
end
