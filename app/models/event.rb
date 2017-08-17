class Event
  @@id = 0

  attr_reader :id

  def initialize
    @id = @@id
    @@id += 1
  end

  private
  attr_writer :id

end
