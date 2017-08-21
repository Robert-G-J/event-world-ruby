require './app/modules/random.rb'

describe Grid do
  subject(:grid) { described_class.new(-1, 1, -1, 1) }
  let(:event_a) { double(:event) }
  let(:event_b) { double(:event) }

  it 'can generate an array of arrays' do
    expect(grid.generate_empty).to eq(
      { [-1, 1] => nil, [0, 1] => nil, [1, 1] => nil,
        [-1, 0] => nil, [0, 0] => nil, [1, 0] => nil,
        [-1,-1] => nil, [0,-1] => nil, [1,-1] => nil }
    )
  end

  it 'can assign an event' do
    grid.assign_to_coordinate(1, 1, event_a )
    expect(grid.area[[1,1]]).to eq(event_a)
  end

  it 'can find Manhattan distance between points' do
    point_a = [-1, -1]
    point_b = [0, 0]
    grid.generate_empty
    grid.assign_to_coordinate(-1, -1, event_a)
    grid.assign_to_coordinate(0, 0, event_b)
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

  describe 'Random Module' do
    subject(:grid) { described_class.new }

    before(:each) do
      grid.extend(GridRandom)
    end

    it 'generates random x value' do
      allow(grid).to receive(:rand) { 1 }
      expect(grid.random_x).to eq(1)
    end
    
    it 'generates random y value' do
      allow(grid).to receive(:rand) { 1 }
      expect(grid.random_y).to eq(1)
    end

    it 'generates random number from 0 to product of range' do
      allow(grid).to receive(:rand) { 1 }
      expect(grid.random_range_product).to eq(1)
    end


  end
end
