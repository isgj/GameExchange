class TitlesController < ApplicationController
  before_action :authenticate_user!

  def index
    name = params[:name_of_the_game]
    if name.blank?
      @games = GameInfo.last(30)
    else
      @games = GameInfo.where("lower(name) ~ ?", name.downcase)
    end
  end

  def show
    @game = GameInfo.find_by_id(params[:id])
    redirect_to titles_path, alert: 'The game was not found' if @game.blank?
    @platforms = Platform.where("api_id IN (?)", @game.platforms)
  end
end
