class RanksController < ApplicationController
  def index
    @new_informations = Information.order(created_at: :DESC).limit(20)
    @
  end
end
