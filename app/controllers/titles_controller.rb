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

  def edit
    @game = GameInfo.find_by_id(params[:id])
    if @game.blank?
      redirect_to titles_path, alert: 'The title you are looking does not exist'
      return
    end
    authorize! :edit, @game
  end

  def update
    @game = GameInfo.find_by_id(params[:id])
    if @game.blank?
      redirect_to titles_path, alert: 'The title you are looking does not exist'
      return
    end
    authorize! :update, @game
    if @game.update(update_params)
      redirect_to title_path(@game), notice: 'The infos were successfuly updated'
    else
      render :edit
    end

  end

  private

    def update_params
      params.require(:title).permit(:name, :summary, :url, :cover, :release_date)
    end
end
