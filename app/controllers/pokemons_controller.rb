class PokemonsController < ApplicationController
  def index
    if params[:user_id].present?
      user = User.find(params[:user_id])
      @pokemons = user.pokemons.order('pkdx_id ASC').paginate(page: params[:page])
    else
      @pokemons = Pokemon.all.order('pkdx_id ASC').paginate(page: params[:page])
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @pok = Pokemon.find_by(id: params[:id])
  end

  def random
  	@pokemon = Pokemon.all.sample # sample prend en compte tous les objets de la classe
  end

  def vote
    @pokemon = Pokemon.find_by(pkdx_id: params[:id])
    if @pokemon.voted_by(request.remote_ip) > 0
      return
    else
      @pokemon.votes.create(
        pokemon_id: :pkdx_id,
        ip_address: request.remote_ip,
        rating: params[:rating]
      )
    end
    respond_to do |format|
      format.js
    end
  end

  def market
    @top_rated =  Pokemon.top_rated.map do |pokemon|
      {
        pokemon: pokemon.to_s,
        rating: pokemon.rating
      }
    end
  end
end
