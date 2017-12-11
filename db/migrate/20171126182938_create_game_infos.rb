class CreateGameInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :game_infos do |t|
      t.integer :api_id
      t.string :name
      t.string :url
      t.text :summary
      t.integer :platforms, array: true
      t.date :release_date
      t.string :cover

      t.timestamps
    end

    add_index :game_infos, :api_id, unique: true
  end
end
