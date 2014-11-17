class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pokemons
  has_many :user_pokemons, through: :pokemons, dependent: :destroy
  has_many :teams

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true



end
