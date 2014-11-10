class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.text :data
      t.string :avatar
      t.integer :pkdx_id, index: true
      t.string :name, index: true

      t.timestamps
    end
  end
end