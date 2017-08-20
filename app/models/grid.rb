# This allows a grid object to create a hash of coordinates as keys with nil values
class Grid

  attr_reader :area

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

  def assign_event(x, y, event)
    self.area[[x,y]] = event
  end

  def man_distance(point_a, point_b)
    raise "Invalid Coordinates" if (!point_a.is_a? Array) || (!point_b.is_a? Array)
    (point_a.first - point_b.first).abs + (point_a.last - point_b.last).abs
  end

  private
  attr_writer :area
end
