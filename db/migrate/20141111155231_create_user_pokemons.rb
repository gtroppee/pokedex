class CreateUserPokemons < ActiveRecord::Migration
  def change
    create_table :user_pokemons do |t|
      t.references :user, index: true
      t.references :pokemon, index: true

      t.timestamps
    end
  end
end
