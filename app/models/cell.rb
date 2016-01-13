class Cell < ActiveRecord::Base
  belongs_to :game

  validates :x, presence: true
  validates :y, presence: true
  validates :value, numericality: { greater_than_or_equal_to: -1, less_than_or_equal_to: 8 }
end
