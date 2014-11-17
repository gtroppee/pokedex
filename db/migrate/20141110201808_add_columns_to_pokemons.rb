class AddColumnsToPokemons < ActiveRecord::Migration
  def change
    add_column :pokemons, :description, :text
  end
end
