class CreateQueries < ActiveRecord::Migration[5.1]
  def change
    create_table :queries do |t|
      t.string :query
      t.integer :games, array: true

      t.timestamps
    end

    add_index :queries, :query, unique: true
  end
end
