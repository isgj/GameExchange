class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :game_info, foreign_key: true, null: false
      t.references :owner, null: false, foreign_key: {to_table: :users}
      t.references :holder, null: false, foreign_key: {to_table: :users}
      t.references :platform, foreign_key: true
      t.integer :state
      t.date :expire
      t.date :start_holding
      t.string :note

      t.timestamps
    end
  end
end
