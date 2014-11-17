class AddAttributesToUserPokemon < ActiveRecord::Migration
  def change
    add_column :user_pokemons, :attack, :integer
    add_column :user_pokemons, :defense, :integer
  end
end
