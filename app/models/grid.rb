class Grid

  def initialize
    @area = {}
  end

  def generate_empty(x_min, x_max, y_min, y_max)
      (x_min..x_max).each { |x|
        (y_min..y_max).each { |y|
          @area[ [x,y] ] = nil
        }
      }
      return @area
  end
end
