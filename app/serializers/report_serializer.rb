class ReportSerializer < ActiveModel::Serializer
  attributes :latitude, :longitude, :title, :subtitle

  def title
    object.pokemon.name
  end

  def subtitle
    "#{title} is in da place !"
  end
end
