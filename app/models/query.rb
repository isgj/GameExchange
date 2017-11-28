class Query < ApplicationRecord
  validate :check_games

  private
  def check_games
    return if games.blank?
    found = GameInfo.where("api_id IN (?)", games).select(:api_id).map {|g| g.api_id}
    missing = games - found
    missing.each { |g| errors.add(:platforms, "cannt find game #{g}") }
  end
end
