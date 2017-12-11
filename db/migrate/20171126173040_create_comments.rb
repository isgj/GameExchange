class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.float :mark
      t.references :commentator, null: false, foreign_key: {to_table: :users}
      t.references :commented, null: false, foreign_key: {to_table: :users}
      t.string :review

      t.timestamps
    end
  end
end
