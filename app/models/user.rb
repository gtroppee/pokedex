class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_pokemons
  has_many :pokemons, through: :user_pokemons, dependent: :destroy
  has_many :teams

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true

  def has_pokemon?(pokemon)
    !user_pokemons.find_by(pokemon_id: pokemon.pkdx_id).nil?
  end

end
