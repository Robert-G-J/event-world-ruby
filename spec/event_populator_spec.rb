describe EventPopulator do
	subject(:event_populator) { described_class.new }
  let(:grid) { double(:grid, :random_range_product => 1, :random_x => 1, :random_y => 1) }
  let(:ticket) { double(:ticket) }
  let(:event) { double(:event, :generate_tickets => true, :add_tickets => [ticket] ) }
  let(:world) { double(:world, :grids => [grid], :events => [event] ) }


	it { is_expected.to respond_to :prepare_world }
	it { is_expected.to respond_to :create_events }
  it { is_expected.to respond_to :generate_tickets }

	it 'prepare_world calls prepare_event' do
    expect(event_populator).to receive(:create_events)
    event_populator.prepare_world(world)
  end

  describe '#create_events' do
    it 'pushes events to memory ' do
      expect(event_populator.events).to receive(:push).at_least(:once)
      event_populator.create_events(world)
    end
  end
  
  describe '#generate_tickets' do
    it 'calls concat on tickets' do
      allow(event_populator).to receive(:rand) { 1 }
      expect(event_populator.generate_tickets).to include(Ticket)
    end
  end


end