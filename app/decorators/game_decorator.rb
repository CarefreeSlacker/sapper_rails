class GameDecorator < Draper::Decorator
  delegate_all

  def make_grid
    game_cells = cells
    result = ['<table class="sapper">']
    (0..(fields_height - 1)).each do |y|
      result << '<tr>'
      (0..(fields_width - 1)).each do |x|
        result << cells.find_by(x: x, y: y).decorate.for_grid
      end
      result << '</tr>'
    end
    result << '</table>'
    result.join('').html_safe
  end

  def status_class
    case lost
    when true; 'game_lost'
    when false; 'game_won'
    when nil; 'still_playing'
    end
  end

  def status_message
    case lost
    when true; 'Игра роиграна'
    when false; 'Игра Выиграна'
    when nil; 'Игра продолжается'
    end
  end

  def opened_cells
    "#{cells.where.not(value: -1).where(open: true).count} / #{safety_cells_count}"
  end

  def cells_data
    cells.order(:x, :y).decorate.map do |cell|
      [
        cell.cell_class,
        cell.cell_picture
      ]
    end.each_slice(fields_width).to_a
  end
end