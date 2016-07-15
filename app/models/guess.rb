class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :round

  def is_correct?
    self.correctness

  end
end
