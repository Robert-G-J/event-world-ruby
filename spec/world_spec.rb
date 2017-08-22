describe World do

	subject(:world) { described_class.new }
	let(:populator) { spy(:populator) }

  it { is_expected.to respond_to(:populate).with(1).argument }

  it 'expects a populator to #prepare_world' do
  	expect(populator).to receive(:prepare_world)
  	world.populate([populator])
  end
	
end