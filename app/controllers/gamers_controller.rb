class GamersController < ApplicationController
  def index
    name = params[:name]
    city = params[:city]

    @gamers = User.all
    @gamers = @gamers.where("lower(name) ~ ?", name.downcase) unless name.blank?
    @gamers = @gamers.where("lower(city) ~ ?", city.downcase) unless city.blank?
  end

  def show
    @gamer = User.find_by_id(params[:id])
  end

  def edit
    @gamer = User.find_by_id(params[:id])
  end

  def update
  end
end
