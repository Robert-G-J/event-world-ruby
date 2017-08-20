describe Ticket do
  subject(:ticket) { described_class.new(10) }
  describe 'has the attribute' do
    it 'of a non-zero price' do
      expect(ticket.price).to be > 0
    end
  end
  describe 'has the behaviour' do
    it 'to change its price' do
      expect { ticket.change_price_to(20) }.to change { ticket.price }.to(20)
    end
    it 'to output price in dollars' do
      expect { ticket.view_price }.to output("$10\n").to_stdout
    end
  end
end
