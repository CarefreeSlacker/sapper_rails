class AttemptionChecker
  include ApplicationHelper

  attr_reader :cell, :result

  def initialize(cell:)
    @cell = cell
  end

  def perform
    cell.update(open: true)
    check_attemption
  end

  private

  def game
    cell.game
  end

  def all_cells
    game.cells
  end

  def check_attemption
    game_over = nil

    if cell.value == 0
      open_empty_near_cells_for(cell)
    end

    if cell.value == -1
      game.loose
      game_over = true
    end

    if game.finished?
      game.win
      game_over = true
    end

    if game_over
      @result = { new_status: game.decorate.status_class, new_message: game.decorate.status_message }
    else
      @result = { still_playing: true }
    end
  end

  def open_empty_near_cells_for(cell)
    make_wave(cell, 0)
    remove_waves
  end

  def make_wave(cell, number)
    return unless cell.wave_number.nil?
    cell.update(open: true, wave_number: number)
    return if cell.value > 0
    run_on_near_cells do |x,y|
      opened_cell = all_cells.find_by(x: cell.x + x, y: cell.y + y)
      make_wave(opened_cell, number + 1) if opened_cell
    end
  end

  def remove_waves
    all_cells.update_all(wave_number: nil)
  end
end