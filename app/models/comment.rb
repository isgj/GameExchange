class Comment < ApplicationRecord
  belongs_to :commented, class_name: "User"
  belongs_to :commentator, class_name: "User"

=begin
  belongs_to :users, through: :commentator_id, foreign_key => 'User'

  belongs_to :commentator, class_name => 'User'
  belongs_to :commented, class_name => 'User'
=end
end
