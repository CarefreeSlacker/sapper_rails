class Game < ActiveRecord::Base
  MAXIMUM_SIZE = 20
  MAXIMUM_BOMBS_COUNT = 90

  has_many :cells

  validates :username, presence: true
  validates :bombs_count, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: MAXIMUM_BOMBS_COUNT }
  validates :fields_height, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: MAXIMUM_SIZE }
  validates :fields_width, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: MAXIMUM_SIZE }
end
