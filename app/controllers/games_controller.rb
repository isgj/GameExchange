class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :rent_back]
  before_action :authenticate_user!, except: [:index]
  before_action :set_title, only: [:new, :create]

  def index
    name = params[:name_of_the_game]
    city = params[:city]
    platform = params[:platform]
    state = request.query_string.split('&')
                    .select {|b| b.starts_with?('state')}
                    .map {|b| b.remove('state=')}
                    .reject {|b| b.empty?}

    if params[:gamer].blank?
      @games = Game.all.includes(:game_info, :platform, :holder)
      @games = @games.joins(:holder).where('lower(users.city) ~ ?', city.downcase) unless city.blank?
    else
      @gamer = User.find_by_id(params[:gamer])
      authorize! :read, @gamer
      if @gamer.blank?
        redirect_to games_path, alert: 'Gamer not found'
        return
      end
      @games = @gamer.hold_games.includes(:game_info, :platform, :holder)
      @rented = @gamer.rented.includes(:game_info, :platform, :holder)
      @rented = @rented.joins(:holder).where('lower(users.city) ~ ?', city.downcase) unless city.blank?
      @rented = @rented.joins(:platform).where('lower(platforms.name) ~ ?', platform.downcase) unless platform.blank?
      @rented = @rented.joins(:game_info).where('lower(game_infos.name) ~ ?', name.downcase) unless name.blank?
    end

    @games = @games.where('state IN (?)', state) unless state.blank?
    @games = @games.joins(:platform).where('lower(platforms.name) ~ ?', platform.downcase) unless platform.blank?
    @games = @games.joins(:game_info).where('lower(game_infos.name) ~ ?', name.downcase) unless name.blank?
  end


  def show
    @desires = @game.desires.includes(:user)
  end

  def new
    @game = Game.new
    @platforms = Platform.where("api_id IN (?)", @g_i.platforms)
    @new = true
  end

  def create
    @game = Game.new(new_game_params)
    init_game

    begin
      p = Platform.find_by_id(params[:game][:platform].to_i)
      @game.platform = p
    rescue => e
      logger.error "Rescued from #{e.inspect}, creating new game"
    end

    if @game.save
      redirect_to @game, notice: 'Game was successfully created'
    else
      @platforms = Platform.where("api_id IN (?)", @g_i.platforms)
      render :new
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    authorize! :update, @game
    @game.update(state_game_params)
    respond_to do |format|
      format.js {}
      format.html { redirect_to game_path(@game), notice: 'The status of the game was updated' }
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    authorize! :destroy, @game
    @game.destroy
    redirect_to gamer_url(current_user), notice: 'Game was successfully destroyed'
  end

  def rent_back
    authorize! :rent_back, @game
    expire = @game.expire
    new_params = {
      holder: @game.owner,
      start_holding: Time.now,
      expire: nil,
      state: 0,
      note: 'Back from rent'
    }
    if @game.update(new_params)
      @game.owner.add_point 5
      current_user.add_point Time.now > expire ? 2 : 5
      redirect_to @game, notice: 'The game was returned'
    else
      redirect_to @game, alert: 'Some errors occured while returning the game'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find_by_id(params[:id])
      redirect_to games_path, alert: 'Game doesn\'t exist' unless @game
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def new_game_params
      params.require(:game).permit(:note)
    end

    def state_game_params
      params.require(:game).permit(:state)
    end

    def set_title
      @g_i = GameInfo.find_by_id(params[:game_info])
      redirect_to titles_path, alert: 'Please select a title' unless @g_i
    end

    def init_game
      @game.update_attributes(
        game_info: @g_i,
        owner: current_user,
        holder: current_user,
        state: 0,
        start_holding: Time.now
      )
    end
end
