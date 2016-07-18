class User < ActiveRecord::Base
  has_secure_password

  has_many :rounds
  has_many :decks, through: :rounds
  has_many :decks, foreign_key: :creator_id
  has_many :cards, through: :decks

  validates :username, presence: true, uniqueness: true
end
