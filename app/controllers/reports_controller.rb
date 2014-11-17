class ReportsController < ApplicationController

  before_action :check_fake_ip

  def create
    pokemon = Pokemon.find(params[:pokemon])
    report = pokemon.reports.new(
      latitude: request.location.latitude,
      longitude: request.location.longitude
    )

    if report.save
      flash[:success] = "#{pokemon} has sucessfully been reported !"
    else
      flash[:danger] = "#{report.errors.full_messages.first}"
    end
    redirect_to pokemon_path(pokemon)
  end

  protected
  def check_fake_ip
  	env['HTTP_X_REAL_IP'] = "81.48.177.151" if Rails.env.development?
  end

end
