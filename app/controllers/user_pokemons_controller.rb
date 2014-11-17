class UserPokemonsController < ApplicationController
	before_action :authenticate_user!

  def index
    @pokemons = Pokemon.all.order('pkdx_id ASC').paginate(page: params[:page])
  end

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
    ids = params['pokemon_ids'].split(',')
    user = current_user

    ids.each do |id|
      pokemon = Pokemon.find_by_id(id)
      @selection = UserPokemon.create(
      	user_id: user.id,
      	pokemon_id: pokemon.id,
        attack: pokemon.data['attack'],
        defense: pokemon.data['defense']
      	)
    end
    redirect_to user_pokemon_path(pokemon.id)
  end

end
