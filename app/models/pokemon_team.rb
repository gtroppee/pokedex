class PokemonTeam < ActiveRecord::Base
  belongs_to :team
  belongs_to :user_pokemon
end
