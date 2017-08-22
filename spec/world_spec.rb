describe World do

	subject(:world) { described_class.new }

  it { is_expected.to respond_to(:prepare).with(1).argument }
	
end