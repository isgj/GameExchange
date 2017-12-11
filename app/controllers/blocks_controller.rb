class BlocksController < ApplicationController
  before_action :authenticate_user!

  def create
    gamer = User.find(params[:blocked_id])
    current_user.block(gamer)
    redirect_to gamer_path(gamer)
  end

  def destroy
    gamer = Block.find(params[:id]).blocked
    current_user.unblock(gamer)
    redirect_to gamer_path(gamer)
  end

end
