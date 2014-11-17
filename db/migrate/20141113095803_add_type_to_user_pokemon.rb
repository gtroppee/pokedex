class AddTypeToUserPokemon < ActiveRecord::Migration
  def change
    add_column :user_pokemons, :type_team, :integer
  end
end
