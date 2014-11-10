class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :pokemon, index: true
      t.string :ip_adress
      t.integer :rating

      t.timestamps
    end
  end
end
