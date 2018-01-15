class Platform < ApplicationRecord
  validates :api_id, presence: true
  validates :generation, inclusion: {in: 1..1000}, allow_blank: true
end
