class Ticket

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
