describe GridPopulator do
  subject(:grid_populator) { described_class.new }
  let(:preparable) { double(:preparable) }

  it "sends prepare message to object" do
    expect(preparable).to receive(:prepare)
    grid_populator.prepare(preparable)
  end

end