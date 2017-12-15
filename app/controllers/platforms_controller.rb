class PlatformsController < ApplicationController
  before_action :authenticate_user!, :set_platform
  load_and_authorize_resource

  def show
    if @platform.blank?
      redirect_to gamer_path(current_user), alert: 'Platform does not exist'
      return
    end
  end

  def edit
    if @platform.blank?
      redirect_to gamer_path(current_user), alert: 'Platform does not exist'
      return
    end
  end

  def update
    if @platform.blank?
      redirect_to gamer_path(current_user), alert: 'Platform does not exist'
      return
    end
    if @platform.update(update_params)
      redirect_to platform_path(@platform), notice: 'The platform was updated'
    else
      render :edit
    end
  end

  private
    def set_platform
      @platform = Platform.find_by_id(params[:id])
    end

    def update_params
      params.require(:platform).permit(:photo, :url, :generation, :name)
    end
end
