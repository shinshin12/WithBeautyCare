class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @informations = current_user.informations
  end

end
