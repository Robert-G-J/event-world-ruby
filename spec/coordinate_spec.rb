describe Coordinate do
  subject(:coord) { described_class.new(0, 1)}

  it "instantiates with an integer x value" do
    expect(coord.x).to equal(0)
  end
  it "instantiates with an integer y value" do
    expect(coord.y).to equal(1)
  end
  it "has a coordinate position based on x, y values" do
    expect(coord.position).to eq([0,1])
  end
end
