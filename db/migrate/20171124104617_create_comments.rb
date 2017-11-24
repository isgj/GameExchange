class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.float :mark
      t.references :commentator
      t.references :commented
      t.string :review

      t.timestamps
    end
    add_foreign_key :comments, :users, column: :commentator_id, primary_key: :id
    add_foreign_key :comments, :users, column: :commented_id, primary_key: :id
  end
end
