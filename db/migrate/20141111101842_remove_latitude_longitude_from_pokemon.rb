class RemoveLatitudeLongitudeFromPokemon < ActiveRecord::Migration
  def change
    remove_column :pokemons, :latitude, :string
    remove_column :pokemons, :longitude, :string
  end
end
