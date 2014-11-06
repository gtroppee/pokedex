class PokemonsController < ApplicationController
  def index
  	@pokemons = Pokemon.all.order('pkdx_id ASC').paginate(page: params[:page])
  # sleep 0.2
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  	@pokemon = Pokemon.find(params[:id])
  end

  def random
  	@pokemon = Pokemon.all.sample # sample prend en compte tous les objets de la classe
  end
end
