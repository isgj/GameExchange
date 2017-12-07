class FriendshipsController < ApplicationController
  before_action :authenticate_user!

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
end
