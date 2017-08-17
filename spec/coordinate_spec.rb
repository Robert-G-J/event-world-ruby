require 'coordinate'

describe Coordinate do
  subject(:coord) { described_class.new(0, 1)}

  it "instantiates with an integer x co-ordinate" do
    expect(coord.x).to equal(0)
  end
  it "instantiateswith an integer y co-ordinate" do
    expect(coord.y).to equal(1)
  end
end
