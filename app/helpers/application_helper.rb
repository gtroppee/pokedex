module ApplicationHelper
	def log
		if user_signed_in?
			"My Account"
		else
			"Connection"
		end
	end

	def user_name(id)
		user = User.find(id)
		return user.name
	end

	def pokemon_in_team(id_team)
		pokemons = PokemonTeam.where(team_id: id_team)
		pokemons = pokemons.map do |p|
			Pokemon.find_by_id(p['pokemon_id'])
		end
	end

	def limit_poke(team_id)
		limit = 3
		poke_by_team = PokemonTeam.where(team_id: team_id).count
		if poke_by_team >= limit
			return 0
		else
			return limit - poke_by_team
		end
	end
end
