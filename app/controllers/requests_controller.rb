class RequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    gamer = User.find(params[:recevier_id])
    current_user.send_request(gamer)
    redirect_to gamer_path(gamer)
  end

  def destroy
    user = current_user.requests.find(params[:applier_id])
    current_user.refuses_request(user)
    redirect_to friends_gamer_path(current_user)
  end
end
