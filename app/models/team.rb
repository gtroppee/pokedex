class Team < ActiveRecord::Base
	belongs_to :user
	has_many :pokemons
	has_many :pokemons_teams, through: :pokemons, dependent: :destroy

  	self.per_page = 20

end
