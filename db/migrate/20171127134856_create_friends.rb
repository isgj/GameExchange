class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.references :friender, null:false, foreign_key: {to_table: :users}
      t.references :friended, null: false, foreign_key: {to_table: :users}
      t.binary :status

      t.timestamps
    end
  end
end
