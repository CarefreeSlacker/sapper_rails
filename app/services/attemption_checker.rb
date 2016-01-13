class AttemptionChecker
  attr_reader :cell

  def initialize(cell:)
    @cell = cell
  end

  def perform
    cell.update(open: true)
    check_attemption
  end

  private

  def check_attemption
    if cell.value == -1
      cell.game.update(lost: true)
    end

    if cell.value == 0
      open_empty_near_cells_for(cell)
    end
  end

  # infinite loop here
  def open_empty_near_cells_for(cell)
    cell.update(open: true)
    return if cell.value > 0
    [-1, 0, 1].each do |x|
      [-1, 0, 1].each do |y|
        next if x == 0 && y == 0
        opened_cell = cell.game.cells.find_by(x: cell.x + x, y: cell.y + y)
        if opened_cell
          open_empty_near_cells_for(opened_cell)
        end
      end
    end
  end
end