class AddInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :photo, :string
    add_column :users, :city, :string
    add_column :users, :phone, :integer
    add_column :users, :points, :integer, default: 0
    add_column :users, :votes, :integer, default: 0
    add_column :users, :avg_vote, :float, default: 0
    add_column :users, :visibility, :boolean, default: true
  end
end
