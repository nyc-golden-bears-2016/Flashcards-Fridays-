class Guess < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :card
  belongs_to :round

  def is_correct?
    self.correctness

  end
end
