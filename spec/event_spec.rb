describe Event do

  subject(:event) { described_class.new }
  let(:ticket) { double(:ticket) }

  describe 'has attributes of' do
    it { is_expected.to respond_to :id }
    it { is_expected.to respond_to :location}
  end

  describe 'has behaviours' do
  	it { is_expected.to respond_to :add_ticket }

  	it 'sends ticket to tickets array' do
  		expect(event.tickets).to receive(:<<)
  		event.add_ticket(ticket)
  	end

  	it 'calls concat on tickets' do
  		expect(event.tickets).to receive(:concat)
  		event.add_tickets([])
  	end
  end

end
