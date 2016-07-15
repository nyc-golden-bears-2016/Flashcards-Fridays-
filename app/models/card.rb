class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :rounds, through: :decks
  belongs_to :creator, through: :deck
  has_many :guesses

  validates :question, :answer, presence: true
end
