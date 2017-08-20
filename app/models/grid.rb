# This allows a grid object to create a hash of coordinates as keys with nil values
class Grid

  def initialize
    @area = {}
  end

  def generate_empty(x_min, x_max, y_min, y_max)
    (x_min..x_max).each do |x|
      (y_min..y_max).each do |y|
        @area[[x, y]] = nil
      end
    end
    @area
  end
end
