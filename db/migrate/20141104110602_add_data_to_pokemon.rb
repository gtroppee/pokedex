class AddDataToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :data, :text
  end
end
