describe World do

	subject(:world) { described_class.new }
	let(:populator) { spy(:populator) }
	let(:event_a) { double(:event_a) }
	let(:event_b) { double(:event_b) }
	let(:event_c) { double(:event_c) }
	let(:grid) { double(:grid, :area => {
     [-1, 1] => event_a, [0, 1] => nil, [1, 1] => nil,
     [-1, 0] => nil, [0, 0] => event_b, [1, 0] => nil,
     [-1,-1] => nil, [0,-1] => nil, [1,-1] => event_c }) }

  it { is_expected.to respond_to(:populate).with(1).argument }
  it { is_expected.to respond_to(:list_closest_events) }

  it 'expects a populator to #prepare_world' do
  	expect(populator).to receive(:prepare_world)
  	world.populate([populator])
  end

  describe '#list_closest_events' do

  	before(:each) do
  		world.add_grid(grid)
  	end

	  it 'closest_events calls get_all_events' do
	  	expect(grid).to receive(:area)
	  	world.list_closest_events([1,1])
	  end

	  it 'calls for cheapest ticket' do
	  	
	  end
	end
	
end