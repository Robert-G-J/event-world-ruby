describe GridPopulator do
  subject(:grid_populator) { described_class.new }
  let(:grid) { double(:grid, :random_range_product => 1, :random_x => 1, :random_y => 1) }
  let(:event) { double(:event) }
  let(:world) { double(:world, :grids => [grid], :events => [event]) }

  it { is_expected.to respond_to(:prepare_world) }
  it { is_expected.to respond_to(:add_events) }

  it 'prepare_world calls add_events' do
    expect(grid_populator).to receive(:add_events)
    grid_populator.prepare_grid(grid, world)
  end

  it 'add_events calls Grid method on double' do
    expect(grid).to receive(:assign_to_coordinate)
    grid_populator.add_events(grid, world)
  end

end