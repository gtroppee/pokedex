class AddAvatarToPokemons < ActiveRecord::Migration
  def change
    add_column :pokemons, :avatar, :string
  end
end
