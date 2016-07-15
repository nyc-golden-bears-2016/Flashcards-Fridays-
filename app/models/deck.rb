class Deck < ActiveRecord::Base
  has_many :cards, dependent: :destroy
  has_many :rounds
  has_many :users, through: :rounds
  belongs_to :creator, :class_name => "User"
end
