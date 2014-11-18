class Tournament < ActiveRecord::Base
	has_many :teams, through: :team_tournaments
end
