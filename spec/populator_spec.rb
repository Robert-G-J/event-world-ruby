describe Populator do
  subject(:populator) { described_class.new }
  let(:preparable) { double(:preparable) }

  it "sends prepare message to object" do
    expect(preparable).to receive(:prepare)
    populator.prepare(preparable)
  end

end