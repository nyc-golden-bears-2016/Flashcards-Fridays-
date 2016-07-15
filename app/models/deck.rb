class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :cards
  has_many :rounds
  has_many :users, through: :rounds
  belongs_to :creator, :class_name => "User"
end
