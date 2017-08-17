require 'coordinate'

describe Coordinate do
  subject(:coord) { described_class.new(0)}

  it "instantiates with an integer x co-ordinate" do
    expect(coord.x).to equal(0)
  end
end
