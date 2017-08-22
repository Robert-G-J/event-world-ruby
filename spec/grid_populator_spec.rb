describe GridPopulator do
  subject(:grid_populator) { described_class.new }
  let(:grid) { double(:grid, :random_range_product => 1, :random_x => 1, :random_y => 1) }
  let(:world) { double(:world, :grids => [grid]) }

  it { is_expected.to respond_to(:prepare_world) }
  it { is_expected.to respond_to(:add_events) }
  it { is_expected.to respond_to(:prepare_grid).with(1).argument }

  it 'prepare_grid calls add_events' do
    expect(grid_populator).to receive(:add_events)
    grid_populator.prepare_grid(grid)
  end

  it 'prepare_world calls prepare_grid' do
    expect(grid_populator).to receive(:prepare_grid)
    grid_populator.prepare_world(world)
  end

  it 'add_events calls Grid method on double' do
    expect(grid).to receive(:assign_to_coordinate)

    grid_populator.add_events(grid)
  end

end