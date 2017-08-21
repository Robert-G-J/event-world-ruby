# This allows a grid object to create a hash of coordinates as keys with nil values
class Grid

  attr_reader :area, :x_min, :x_max, :y_min, :y_max

  def initialize( x_min = -1,
                  x_max = 1,
                  y_min = -1,
                  y_max = 1)
    @area = {}
    @x_min, @x_max, @y_min, @y_max = x_min, x_max, y_min, y_max
    @x_range = x_max - x_min
    @y_range = y_max - y_min
  end

  def generate_empty
    (self.x_min..self.x_max).each do |x|
      (self.y_min..self.y_max).each do |y|
        self.area[[x, y]] = nil
      end
    end
    self.area
  end

  def assign_to_coordinate(x, y, object)
    self.area[[x,y]] = object
  end

  def man_distance(start_point, end_point)
    raise "Invalid Coordinates" if (!start_point.is_a? Array) || (!end_point.is_a? Array)
    (start_point.first - end_point.first).abs + (start_point.last - end_point.last).abs
  end

  private
 
  attr_writer :area

end
