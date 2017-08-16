require 'ticket'

describe Ticket do
  subject(:ticket) { described_class.new(10) }
  describe "has the attribute" do
    it "of a non-zero price" do
      expect(ticket.price).to be > 0
    end
  end
  describe "has the behaviour" do
    it "to change its price" do
      expect{ ticket.change_price_to(20) }.to change{ ticket.price }.to(20)
    end
  end
end
