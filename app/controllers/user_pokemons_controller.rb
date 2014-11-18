class UserPokemonsController < ApplicationController
	before_action :authenticate_user!

  def index
    @pokemons = Pokemon.all.order('pkdx_id ASC').paginate(page: params[:page])
  end

  def show
  	pokemons = UserPokemon.select(:pokemon_id).where(user_id: current_user.id)
    @pokes = pokemons.all.map do |p| p.pokemon_id end
  end


  def create

    new_ids = params['pokemon_ids'].split(',').map(&:to_i)
    return @limit_reached = true if new_ids.size > 10

    new_ids.push(-1) ## valeur d'arret
    current_ids = UserPokemon.all.map do |id| id.pokemon_id end
## delete les absents
    current_ids.each do |c_id|
      new_ids.each do |n_id|
        if c_id == n_id
          break
        elsif n_id == -1
          UserPokemon.where(pokemon_id: c_id).destroy_all
        end
      end
    end

## add les nouveaux
    new_ids.each do |n|
      if UserPokemon.find_by(pokemon_id: n).nil? && n != -1
        pokemon = Pokemon.find_by(pkdx_id: n)
        UserPokemon.create(
          user_id:    current_user.id,
          pokemon_id: pokemon.pkdx_id,
          attack:     pokemon.data['attack'],
          defense:    pokemon.data['defense']
        )
      end
    end
    respond_to do |format|
      format.js
    end
  end
end
