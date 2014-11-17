class AddColToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :bio, :text
    add_column :users, :gender, :boolean
    add_column :users, :name, :string
  end
end
