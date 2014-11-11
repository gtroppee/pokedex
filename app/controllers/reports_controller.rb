class ReportsController < ApplicationController
  def create
    pokemon = Pokemon.find(params[:pokemon])
    report = pokemon.reports.new(
      latitude: request.location.latitude,
      longitude: request.location.longitude
    )

    if report.save
      flash[:success] = "#{pokemon} has sucessfully been reported !"
    else
      flash[:danger] = "#{pokemon} has already been reported here !"
    end
    redirect_to pokemon_path(pokemon)
  end
end
