class AddAvatarToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :avatar, :string
  end
end
