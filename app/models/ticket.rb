# Tickets belong to Events in a many-to-one association.
class Ticket
  include DataMapper::Resource

  property :id,      Serial
  property :price,   Decimal


  attr_reader :price

  def initialize(price)
    @price = price
  end

  def view_price
    puts "$#{self.price}"
  end

  def change_price_to(new_price)
    self.price = new_price
  end

  private

  attr_writer :price
end
