class RanksController < ApplicationController
  PER = 10

  def set
    @rank_information = Information.all
    @rank_information = Information.order(impression_count: "DESC").page(params[:page]).per(PER)
  end
  def put
    @like_information = Information.all
    @like_information = Information.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}.page(params[:page]).per(PER)
  end
  def read
    @user_relations = User.all
    @user_relations = Relation.group(:followed_id).order('count(followed_id) DESC').page(params[:page]).per(PER)
  end
end
