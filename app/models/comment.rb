class Comment < ApplicationRecord
  belongs_to :commented, class_name: "User"
  belongs_to :commentator, class_name: "User"
end
