class CreateDesires < ActiveRecord::Migration[5.1]
  def change
    create_table :desires do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.integer :statuses, array: true

      t.timestamps
    end

    add_index :desires, [:user_id, :game_id], unique: true

  end
end
