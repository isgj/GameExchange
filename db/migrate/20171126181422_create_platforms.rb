class CreatePlatforms < ActiveRecord::Migration[5.1]
  def change
    create_table :platforms do |t|
      t.integer :api_id
      t.string :name
      t.string :photo
      t.string :url
      t.integer :generation

      t.timestamps
    end

    add_index :platforms, :api_id, unique: true
  end
end
