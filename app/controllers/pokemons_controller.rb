class PokemonsController < ApplicationController
  def index
  	@pokemons = Pokemon.all.order('pkdx_id ASC').paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  	@pokemon = Pokemon.find(params[:id])
  end

  def random
  	@pokemon = Pokemon.all.sample
  end
end
