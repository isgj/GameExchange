class FriendsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_friends

  def index
  end

  private

    def get_friends
      @friend = Friend.where("(friender_id = ? or friended_id = ?) and status = ?", params[:gamer], params[:gamer],"Friends")
      redirect_to gamers_path, alert: "No friends to show" unless @friend
    end
end
