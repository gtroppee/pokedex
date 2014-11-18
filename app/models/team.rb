class Team < ActiveRecord::Base
	belongs_to :user
	has_many :pokemons
	# has_many :pokemons_teams, through: :pokemons, dependent: :destroy
	# has_many :user_pokemons, through: :pokemons_teams
	has_many :tournaments, through: :team_tournaments
  	self.per_page = 20

end
