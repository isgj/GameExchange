class Desire < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :user, :game, :statuses, presence: true
  validate :check_user, :check_state

  private
    def check_user
      if user.present? && game.present?
        if user == game.holder
          errors.add(:user, 'already hold the game')
        end
        if user == game.owner
          errors.add(:user, 'already own the game')
        end
      end
    end

    def check_state
      if statuses.present?
        statuses.uniq!
        errors.add(:statuses, 'cannot hold more than 3 states') if statuses.size > 3
        if statuses.select{|s| s>3 || s<1}.any?
          errors.add(:statuses, 'found unknow states')
        end
      end
    end
end
