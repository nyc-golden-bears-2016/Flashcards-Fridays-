class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :round

  def is_correct?
    self.correctness
  end

  def self.create_blank_guesses(num_of_cards, round_id, cards)
    num_of_cards.times do |num|
      Guess.create(round_id: round_id, card_id: cards[num].id)
    end
  end

end
