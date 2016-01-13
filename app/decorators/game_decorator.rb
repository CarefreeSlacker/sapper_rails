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
end