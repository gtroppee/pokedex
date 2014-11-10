class Pokemon < ActiveRecord::Base
  has_many :votes
  serialize :data, Hash

  ATTRIBUTES = %w()

  self.per_page = 20

  ATTRIBUTES.each do |attr|
    define_method(attr) do
      data[attr]
    end
  end

  def to_s
    name
  end

  def self.top_rated(limit = 7)
    Pokemon.all.sort_by{|p| p.rating }.reverse.first(limit)
  end

  def type_string
    types.join(' ')
  end

  def types
    data['types'].map{|t| t['name']}
  end

  def evolutions
    return [] if self.data['evolutions'].empty?
    return [] if self.to_s.empty?
    return [] if self.avatar.empty?

    pok = data['evolutions'][0]['to']
    return Pokemon.find_by(name: pok)
  end

  def voted_by(ip_adress)
    self.votes.where(ip_address: ip_adress, pokemon_id: self.id).count
  end

  def rating
    votes_count = votes.size.zero? ? 1 : votes.size
    "%0.1f" % (votes.sum(:rating).to_f / votes_count)
  end

end
