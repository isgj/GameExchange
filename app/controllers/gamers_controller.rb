class GamersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :get_gamer, except: [:index]

  def index
    name = params[:name]
    city = params[:city]

    @gamers = User.all
    @gamers = @gamers.where("lower(name) ~ ?", name.downcase) unless name.blank?
    @gamers = @gamers.where("lower(city) ~ ?", city.downcase) unless city.blank?
    @gamers = @gamers.where("visibility = 't'")
  end

  def show
  end

  def edit
  end

  def update
    if @gamer.update_attributes(gamer_params)
      redirect_to gamer_path(@gamer), notice: 'User was succesfully updated'
    else
      render :edit
    end
  end

  private

    def gamer_params
      params.require(:gamer).permit(:name, :city, :phone,
        :visibility, :photo, :age, :gender)
    end

    def get_gamer
      @gamer = User.find_by_id(params[:id])
      redirect_to gamers_path , alert: "Gamer not found" unless @gamer
    end
end
