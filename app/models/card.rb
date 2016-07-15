class Card < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :deck
  has_many :rounds, through: :decks
  belongs_to :creator, :class_name => 'Deck'
  has_many :guesses
end
