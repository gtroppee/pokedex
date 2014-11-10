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

  # def market
  #   @top_vote = Vote.select('ip_adress, pokemon_id').group('pokemon_id').count
  #   @top_vote = @top_vote.sort_by {|k, v| v}.reverse.first(10)

  #   @pokemons = Pokemon.find_by(:data => ['name'] params[:id])
  #   # @top_vote.each do |k, v|
  #   #   Vote.where(pokemon_id: k).sum(rating:) / v
  #   #   puts " k = v "
  #   #   binding.pry
  #   # end

  # end

end
