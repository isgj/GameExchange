class DesiresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_desire, only: [:update, :destroy]
  before_action :form_statuses, only: [:update, :create]

  def create
    set_game
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
    redirect_to game_path(params[:game_id]), notice: 'Your request was successfully destroyed'
  end

  private
    def set_desire
      @desire = Desire.find(params[:id])
      redirect_to games_path(params[:game_id]), alert: 'You haven\'t make a request for this game' unless @desire
    end

    def set_game
      @game = Game.find(params[:game_id])
      redirect_to gamers_path(current_user), alert: 'Game not found' unless @game
    end

    def form_statuses
      @statuses = []
      @statuses << 1 if params[:status1]
      @statuses << 2 if params[:status2]
      @statuses << 3 if params[:status3]
    end
end
