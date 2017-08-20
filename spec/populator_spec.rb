describe Populator do
  subject(:populator) { described_class.new }
  let(:event_a) { double(:event) }
  grid = {
     [-1, 1] => nil, [0, 1] => nil, [1, 1] => nil,
     [-1, 0] => nil, [0, 0] => nil, [1, 0] => nil,
     [-1,-1] => nil, [0,-1] => nil, [1,-1] => nil }

  it "makes a grid" do
    expect(populator.make_random_grid).to eq(grid)
  end
end

# expect make_random_grid should:
# make a grid
# (randomly) add events to the grid
# store the grid
