class Pokemon < ActiveRecord::Base
  has_many :votes
  serialize :data, Hash

  self.per_page = 20

  def type_string
    types.join(' ')
  end

  def types
    data['types'].map{|t| t['name']}
  end

  def method_missing(method_name)
    super unless data.has_key?("#{method_name}")
    data["#{method_name}"]
  end

  def respond_to_missing?(method_name, include_private = false)
    data.has_key?("#{method_name}") || super
  end

  def voted_by(ip_adress)
    self.votes.where(ip_address: ip_adress, pokemon_id: self.id).count
  end

  def rating
    votes_count = votes.size.zero? ? 1 : votes.size
    votes.sum(:rating) / votes_count
  end

end
