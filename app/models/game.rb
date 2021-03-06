class Game < ActiveRecord::Base
  MAXIMUM_SIZE = 20
  MAXIMUM_BOMBS_COUNT = 90

  has_many :cells

  validates :username, presence: true
  validates :bombs_count, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: MAXIMUM_BOMBS_COUNT }
  validates :fields_height, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: MAXIMUM_SIZE }
  validates :fields_width, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: MAXIMUM_SIZE }

  self.per_page = 10

  def safety_cells_count
    Rails.cache.fetch(self) do
      (fields_height * fields_width) - bombs_count
    end
  end

  def finished?
    cells.where(open: true).count == safety_cells_count
  end

  def win
    update(lost: false)
    cells.update_all(open: true)
  end

  def loose
    update(lost: true)
    cells.update_all(open: true)
  end
end
