module GridRandom
  
  def random_x
    rand(self.x_min..self.x_max)
  end

  def random_y
    rand(self.y_min..self.y_max)
  end

  def random_range_product
    rand(0..@x_range*@y_range)
  end

end