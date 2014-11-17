class UserPokemonsController < ApplicationController
	before_action :authenticate_user!

  def show
  	user = current_user.id
  	@pokemons = UserPokemon.select(:pokemon_id).where(user_id: user)
    @pokes = @pokemons.map do |p|
      Pokemon.find_by_id(p['pokemon_id'])
    end
  	id_poke = UserPokemon.where(user_id: current_user.id).last
  	@new_poke = Pokemon.find_by_id(id_poke['pokemon_id'])
  end

  def create
  	pokemon = Pokemon.find(params[:pokemon])
  	user = current_user
    @selection = UserPokemon.create(
    	user_id: user.id,
    	pokemon_id: pokemon.id
    	)
    redirect_to user_pokemon_path(pokemon.id)
  end

end
