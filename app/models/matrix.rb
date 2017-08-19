require 'matrix'
# alteration to Ruby Matrix class
class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end
