class PokeTypesController < ApplicationController
  def index
  	@poketypes = HTTParty.get("http://pokeapi.co/api/v1/type?limit=0")['objects']
  	@nb_types = @poketypes.count
  end

  def show
  	id = params[:id]
  	@name = params[:name]
  	@poketype = HTTParty.get("http://pokeapi.co/api/v1/type/#{id}")
  end
end
