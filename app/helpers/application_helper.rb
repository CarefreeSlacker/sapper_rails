module ApplicationHelper
  def run_on_near_cells(&block)
    [-1, 0, 1].each do |x|
      [-1, 0, 1].each do |y|
        next if x == 0 && y == 0
          yield(x, y)
      end
    end
  end
end
