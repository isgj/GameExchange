class GameInfo < ApplicationRecord
  validate :check_platforms

  private
  def check_platforms
    if !platforms.blank?
      found = Platform.where("api_id IN (?)", platforms).select(:api_id).map {|p| p.api_id}
      missing = platforms - found
      missing.each { |p| errors.add(:platforms, "cannt find platform #{p}") }
    end
  end
end
