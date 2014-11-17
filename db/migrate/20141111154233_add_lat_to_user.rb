class AddLatToUser < ActiveRecord::Migration
  def change
    add_column :pokemons, :latitude, :float
    add_column :pokemons, :longitude, :float
  end
end
