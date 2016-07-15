class Card < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :deck
  has_many :rounds, through: :decks
  belongs_to :creator, through: :deck
  has_many :guesses
end
