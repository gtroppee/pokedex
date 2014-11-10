class AddLatLnToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :latitude, :string
    add_column :pokemons, :longitude, :string
  end
end
