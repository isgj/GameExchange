class WelcomeController < ApplicationController
  before_action :get_gamers
  before_action :get_games
  before_action :get_titles

  def index
  end

  private
    def get_gamers
      @gamers = User.order("id DESC").limit(3)
    end

    def get_games
      @games = Game.order("id DESC").limit(6).includes(:game_info)
    end

    def get_titles
      @titles = GameInfo.order("id DESC").limit(6)
    end
end
