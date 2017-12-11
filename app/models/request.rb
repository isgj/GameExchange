class Request < ApplicationRecord
  belongs_to :applier, class_name: "User"
  belongs_to :recevier, class_name: "User"
  validates :applier_id, presence: true
  validates :recevier_id, presence: true
end
