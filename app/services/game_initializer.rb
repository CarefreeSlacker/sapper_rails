class GameInitializer
  include ApplicationHelper
  attr_reader :game

  def initialize(game:)
    @game = game
  end

  def perform
    initialize_game
    mine_bombs
    fill_empty_fields
  end

  private

  def width; game.fields_width; end

  def height; game.fields_height; end

  def cells; game.cells; end

  def bombs_count; game.bombs_count; end

  def initialize_game
    return if game_has_enough_cells?
    game.cells.delete_all
    (0..(height - 1)).each do |y|
      (0..(width - 1)).each do |x|
        cells.create(x: x, y: y)
      end
    end
  end

  def mine_bombs
    return [] if game_has_enough_mines?
    bombs_rest = bombs_count
    while bombs_rest > 0 do
      cell = cells.find_by(x: rand(width), y: rand(height))
      next if cell.value == -1
      cell.update(value:-1)
      bombs_rest -= 1
    end
  end

  def fill_empty_fields
    cells.where(value: 0).each{ |cell| cell.update(value: count_bombs_for(cell)) }
  end

  def game_has_enough_cells?
    cells.count == (width * height)
  end

  def game_has_enough_mines?
    cells.where(value: -1).count == bombs_count
  end

  def count_bombs_for(cell)
    bombs_count = 0
    run_on_near_cells do |x,y|
      count_cell = cells.find_by(x: cell.x + x, y: cell.y + y)
      next unless count_cell && count_cell.value == -1
      bombs_count += 1
    end
    bombs_count
  end
end