class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_gamer

  def create
    gamer = User.find(params[:friended_id])
    current_user.add_friend(gamer)
    redirect_to gamer_path(gamer)
  end

  def destroy
    user = Friendship.find(params[:id]).friended
    if current_user == user
      user = Friendship.find(params[:id]).friender
    end
    current_user.unfriend(user)
    redirect_to gamer_path(user)
  end

  private

    def get_gamer
      @gamer = User.find_by_id(params[:id])
    end
end
