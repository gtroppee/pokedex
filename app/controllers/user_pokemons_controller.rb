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
    ids = params['pokemon_ids'].split(',').map(&:to_i)
    return @limit_reached = true if ids.size > 30

    current_user.user_pokemons.delete_all #TODO find a better way to do this shit

    ids.each do |id|
      pokemon = Pokemon.find_by_id(id)
      @selection = UserPokemon.create(
      	user_id:    current_user.id,
      	pokemon_id: pokemon.id,
        attack:     pokemon.data['attack'],
        defense:    pokemon.data['defense']
      	)
    end

    respond_to do |format|
      format.js
    end
  end
end
