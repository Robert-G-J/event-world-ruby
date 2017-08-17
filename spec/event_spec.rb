describe Event do

  subject(:event) { described_class.create }

  describe 'has attributes of' do
    it 'id' do
      expect(event.id).to eq(1)
    end
  end
end
