class Report < ActiveRecord::Base
  belongs_to :pokemon
  validate  :unicity_constraint

  protected
    def unicity_constraint
      if Report.where(pokemon: pokemon, latitude: latitude, longitude: longitude).any?
        errors.add(:base, "#{pokemon} has already been reported here.")
      end
    end
end
