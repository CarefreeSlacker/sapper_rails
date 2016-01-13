class CellDecorator < Draper::Decorator
  delegate_all

  def for_grid
    "<td class=\"table_cell #{cell_class}\">#{cell_picture}</td>"
  end

  private

  def cell_class
    return 'closed' unless open?
    case value
    when -1
      'bomb'
    when 0
      'empty'
    else
      'numbers'
    end
  end

  def cell_picture
    return value if open? && value > 0
  end
end