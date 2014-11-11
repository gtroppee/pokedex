class PokemonSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar
  has_many :reports
end
