require 'ticket'

describe Ticket do
  subject(:ticket) { described_class.new(10) }
  describe "has the attribute" do
    it "of a non-zero price" do
      expect(ticket.price).to be > 0
    end
  end
end
