class AddKeyToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :pkdx_id, :integer
  

	  Pokemon.find_each do |poke|
	  	poke.update_attributes(pkdx_id: poke.data['pkdx_id'])
	  end
  end
end
