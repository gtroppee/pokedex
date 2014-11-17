class TeamsController < ApplicationController
	before_action :authenticate_user!

  def index
  	@types = HTTParty.get("http://pokeapi.co/api/v1/type?limit=0")['objects'].map{|t| t['name']}
  	@user = current_user.id
  	@team = Team.new

  end

  def create
  	@team = Team.create(params_team)
  	redirect_to @team
  end

  def show
  	@pokemons = Pokemon.all.order('pkdx_id ASC').paginate(page: params[:page])
  	@team = Team.where(user_id: current_user.id).last
  	respond_to do |format|
      format.html
      format.js
    end
  end

  def show_all
  	@teams = Team.where(user_id: current_user.id)
  end

  def last
    @teams = Team.all.order('created_at DESC')
  end

  private
  def params_team
  	params.require(:team).permit(:type_team, :user_id)
  end
end
