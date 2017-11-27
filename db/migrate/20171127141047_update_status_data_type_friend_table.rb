class UpdateStatusDataTypeFriendTable < ActiveRecord::Migration[5.1]
  def change
    change_column :friends, :status, :string
  end
end
