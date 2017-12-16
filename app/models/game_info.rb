class GameInfo < ApplicationRecord
  validate :check_platforms, :check_release_date

  private
  def check_platforms
    if !platforms.blank?
      found = Platform.where("api_id IN (?)", platforms).select(:api_id).map {|p| p.api_id}
      missing = platforms - found
      missing.each { |p| errors.add(:platforms, "cannt find platform #{p}") }
    end
  end

  def check_release_date
    if release_date.present? && release_date > Date.today
      errors.add(:release_date, 'cannt be after today')
    end
  end
end
