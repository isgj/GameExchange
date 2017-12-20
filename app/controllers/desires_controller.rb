class DesiresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: [:create, :accept]
  before_action :set_desire, only: [:update, :destroy, :accept]
  before_action :form_statuses, only: [:update, :create]
  before_action :show_desire, only: [:show]

  def index
    @desires = current_user.desires.includes(:game)
  end

  def show
    @game = @desire.game
    @game_info = @game.game_info
  end

  def create
    authorize! :desire, @game
    desire = @game.desires.new({user: current_user, game: @game, statuses: @statuses})
    if desire.save
      redirect_to game_path(@game), notice: 'Your request was saved'
    else
      desire.errors.full_messages.each{|m| logger.error m}
      redirect_to game_path(@game), alert: 'Some errors happend'
    end
  end

  def update
    authorize! :update, @desire
    if @desire.update({statuses: @statuses})
      redirect_to game_path(params[:game_id]), notice: 'Your request was updated'
    else
      @desire.errors.full_messages.each{|m| logger.error m}
      redirect_to game_path(params[:game_id]), alert: 'Some errors occured while updating your rerquest'
    end
  end

  def destroy
    authorize! :destroy, @desire
    @desire.destroy
    if params[:game_id]
      redirect_to game_path(params[:game_id]), notice: 'The request was successfully destroyed'
    else
      redirect_to desires_path, notice: 'Your request was successfully destroyed'
    end
  end

  def accept
    authorize! :accept_request, @game
    status = check_param
    return unless status
    new_params = {
      holder: @desire.user,
      start_holding: Time.now
    }
    if status == 3
      new_params[:expire] = params[:expire]
      new_params[:state] = 4
      new_params[:note] = 'Rented'
    else
      new_params[:owner] = @desire.user
      new_params[:state] = 0
      new_params[:note] = status == 1 ? 'Bought it' : 'Gift'
    end

    if @game.update(new_params)
      @desire.destroy
      redirect_to game_path(params[:game_id]), notice: 'The request was accepted'
    else
      @game_info = @game.game_info
      render :show
    end
  end

  private
    def set_desire
      @desire = Desire.find(params[:id])
      redirect_to games_path(params[:game_id]), alert: 'This request does not exist' unless @desire
    end

    def set_game
      @game = Game.find(params[:game_id])
      redirect_to gamers_path(current_user), alert: 'Game not found' unless @game
    end

    def show_desire
      @desire = Desire.find_by_id(params[:id])
      unless @desire
        redirect_to gamer_path(current_user), alert: 'No request could be found in that page'
        return
      end
      authorize! :accept_request, @desire.game
    end

    def form_statuses
      @statuses = []
      @statuses << 1 if params[:status1]
      @statuses << 2 if params[:status2]
      @statuses << 3 if params[:status3]
    end

    def check_param
      begin
        status = params[:status].to_i
      rescue => e
        logger.error "Rescued from #{e.inspect} in check_param"
        redirect_to desire_path(@desire), alert: 'You should choose one state'
        return
      end
      err_msg = 'You should choose a status'
      right_params = true
      right_params &&= status
      right_params &&= @desire.statuses.include?(status)
      if right_params && status == 3
        right_params &&= params[:expire]
        err_msg = 'You should choose the expire date'
      end
      unless right_params
        redirect_to desire_path(@desire), alert: err_msg
        return
      end
      status
    end
end
