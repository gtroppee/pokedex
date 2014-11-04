class PokemonsController < ApplicationController
  def index
  	@pokemons = HTTParty.get("http://pokeapi.co/api/v1/pokemon?limit=12&offset=0")['objects']
  end

  def show
  	id = params[:pkdx_id]
  	@pokemon = HTTParty.get("http://pokeapi.co/api/v1/pokemon/#{id}")	
  end

  def random
  	random_id = Time.now.to_i % 778 #@pokemons.count
  	@pokemon = HTTParty.get("http://pokeapi.co/api/v1/pokemon/#{random_id}")
  end
end
