class AddPersonalInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :age, :integer
    add_column :users, :gender, :char
  end
end
