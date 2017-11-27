class FriendsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_friender

  def show
  end

  private

    def get_friender
      @friend = Friend.where("friender_id = ? and status = ?", params[:id], "Friends")
      redirect_to gamers_path, alert: "No friends to show" unless @friend
    end
end
