class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :applier_id
      t.integer :recevier_id

      t.timestamps
    end
    add_index :requests, :applier_id
    add_index :requests, :recevier_id
    add_index :requests, [:applier_id, :recevier_id], unique: true
  end
end
