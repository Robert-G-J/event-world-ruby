describe Populator do
  subject(:populator) { described_class.new }
  event_a = Event.new

  grid_with_event = {
     [-1, 1] => event_a, [0, 1] => nil, [1, 1] => nil,
     [-1, 0] => nil, [0, 0] => nil, [1, 0] => nil,
     [-1,-1] => nil, [0,-1] => nil, [1,-1] => nil }

  it "makes grid, adds event" do
    expect(populator.make_random_grid).to eq(grid_with_event)
  end
end

# expect make_random_grid should:
# make a grid
# (randomly) add events to the grid
# store the grid
