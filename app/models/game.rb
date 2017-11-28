class Game < ApplicationRecord
  belongs_to :game_info
  belongs_to :owner, class_name: "User"
  belongs_to :holder, class_name: "User"
  belongs_to :platform
  
  validates :state, inclusion: {in: 0..4}
  validates :start_holding, presence: true
  validate :expire_after_hold, :expire_in_rented

  private
  def expire_after_hold
    if !expire.blank?
      errors.add(:expire, "should be after you hold the game") if expire >= start_holding
    end
  end

  def expire_in_rented
    if expire.blank?
      errors.add(:expire, "should exists if state is rented") if state == 4
    else
      errors.add(:expire, "should not be present if state different from rented") if state != 4
    end
  end
end
