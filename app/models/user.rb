class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_many :decks, through: :rounds
  has_many :decks
  has_many :cards through: :decks
end
