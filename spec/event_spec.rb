require 'event'

describe Event do

  subject(:event) { described_class.new }
  let(:event1) { described_class.new }

  describe 'has attributes of' do
    it 'id' do
      event
      event1 # the events must be called into the id block for the test
      expect(event1.id).to eq(1)
    end
  end
end
