describe GridPopulator do
  subject(:grid_populator) { described_class.new }

  it { is_expected.to respond_to(:prepare_world) }
end