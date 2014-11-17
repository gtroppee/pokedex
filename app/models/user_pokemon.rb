class UserPokemon < ActiveRecord::Base
  belongs_to :user
  belongs_to :pokemon
  has_many :teams
  has_many :pokemon_teams, through: :teams
end
