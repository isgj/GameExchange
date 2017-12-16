class TitlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_title, only: [:show, :edit, :update]

  def index
    name = params[:name_of_the_game]
    if name.blank?
      @games = GameInfo.last(30)
    else
      @games = GameInfo.where("lower(name) ~ ?", name.downcase)
    end
  end

  def show
    @platforms = Platform.where("api_id IN (?)", @game.platforms)
  end

  def edit
    authorize! :edit, @game
  end

  def update
    authorize! :update, @game
    if @game.update(update_params)
      redirect_to title_path(@game), notice: 'The infos were successfuly updated'
    else
      render :edit
    end

  end

  private
    def set_title
      @game = GameInfo.find_by_id(params[:id])
      redirect_to titles_path, alert: 'The title you are looking does not exist' unless @game
    end

    def update_params
      params.require(:title).permit(:name, :summary, :url, :cover, :release_date)
    end
end
