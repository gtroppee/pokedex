class UserPokemon < ActiveRecord::Base
  belongs_to :user
  belongs_to :pokemon
  has_many :teams
  # has_many :pokemon_teams, through: :teams

  validate  :unicity_constraint

  protected
    def unicity_constraint
      if UserPokemon.where(user: user, pokemon: pokemon).any?
        errors.add(:base, "This pokemon already exists")
      end
    end
end
