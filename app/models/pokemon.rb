class Pokemon < ActiveRecord::Base
  serialize :data, Hash

  self.per_page = 20

  def avatar
    sprites[0]['resource_uri']
  end

  def method_missing(method_name)
    super unless data.has_key?("#{method_name}")
    data["#{method_name}"]
  end

  def respond_to_missing?(method_name, include_private = false)
    data.has_key?("#{method_name}") || super
  end
end
