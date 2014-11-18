class TeamTournamentsController < ApplicationController
  include ApplicationHelper

  def index
  	@id_tour = params['tour_id'].to_i
  	binding.pry
  	pokemons = UserPokemon.all.where(user_id: current_user).paginate(page: params[:page])
  	@pokemons = pokemons.map do |p|
			Pokemon.find_by(pkdx_id: p['pokemon_id'])
		end
  	# binding.pry
  end

  def create
  end

  def show
  end
end
