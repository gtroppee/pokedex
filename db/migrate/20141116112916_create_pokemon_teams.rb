class CreatePokemonTeams < ActiveRecord::Migration
  def change
    create_table :pokemon_teams do |t|
      t.references :team, index: true
      t.references :pokemon, index: true

      t.timestamps
    end
  end
end
