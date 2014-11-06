class AddPkdxIdToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :pkdx_id, :integer
    
    Pokemon.find_each do |pokemon|
      pokemon.update_attributes(pkdx_id: pokemon.data['pkdx_id'])
    end
  end
end
