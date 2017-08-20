describe Grid do
  subject(:grid) { described_class.new }
  let(:event_a) { double(:event) }
  let(:event_b) { double(:event) }
  it 'can generate an array of arrays' do
    expect(grid.generate_empty(-1, 1, -1, 1)).to eq(
      { [-1, 1] => nil, [0, 1] => nil, [1, 1] => nil,
        [-1, 0] => nil, [0, 0] => nil, [1, 0] => nil,
        [-1,-1] => nil, [0,-1] => nil, [1,-1] => nil }
    )
  end
  it 'can find Manhattan distance between points' do
    point_a = [-1, -1]
    point_b = [0, 0]
    grid.generate_empty(-1, 1, -1, 1)
    grid.assign_event(-1, -1, event_a)
    grid.assign_event(0, 0, event_b)
    expect(grid.man_distance(point_a, point_b)).to eq(2)
  end

  describe 'throws exception' do
    it 'if single integer given to #man_distance' do
      expect { grid.man_distance(2, [1,1]) }.to raise_error("Invalid Coordinates")
    end
    it 'if two integers given to #man_distance' do
      expect { grid.man_distance(2, 3) }.to raise_error("Invalid Coordinates")
    end
  end
end
