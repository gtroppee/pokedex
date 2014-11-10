class AddVoteCountToPokemons < ActiveRecord::Migration
  def change
    add_column :pokemons, :vote_count, :integer
  end
end
