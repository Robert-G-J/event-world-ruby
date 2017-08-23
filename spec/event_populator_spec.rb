describe EventPopulator do
	subject(:event_populator) { described_class.new }
  let(:grid) { double(:grid, :random_range_product => 1, :random_x => 1, :random_y => 1) }
  let(:world) { double(:world, :grids => [grid]) }

	it { is_expected.to respond_to :prepare_world }

	it 'prepare_world calls prepare_event' do
    expect(event_populator).to receive(:prepare_event)
    event_populator.prepare_world(world)
  end
end