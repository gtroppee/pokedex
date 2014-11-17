class PokemonTeam < ActiveRecord::Base
  belongs_to :team
  belongs_to :pokemon


end
