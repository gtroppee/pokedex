class PokemonTeamsController < ApplicationController
	before_action :authenticate_user!
  include ApplicationHelper

  def create
  	team = Team.find(params[:team])
  	pokemon = Pokemon.find(params[:pokemon])
  	selection = PokemonTeam.new(
  		team_id: team.id,
  		pokemon_id: pokemon.id
  		)
    selection.save!
    if limit_poke(team.id) == 0
      redirect_to last_teams_path
    else
      redirect_to team_path(team.id)
    end
  end

  def show
  	@team = Team.find(params[:id])
    @pokes = pokemon_in_team(@team.id)

    # binding.pry
  end
end
