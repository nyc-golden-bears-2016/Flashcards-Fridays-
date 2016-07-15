class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :cards, through: :decks
  has_many :guesses


  def next_question
    self.deck_id.
  end
end
