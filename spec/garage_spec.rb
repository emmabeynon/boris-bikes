require 'garage'
describe Garage do
  subject(:garage) { described_class.new }
  let(:bike) { double :bike}

  describe '#default' do
    it 'allows capacity to be set' do
      bike_garage = described_class.new(50)
      expect(bike_garage.capacity).to eq 50
    end

    it 'it sets a default cacpacity' do
      expect(garage.capacity).to eq Garage::DEFAULT_CAPACITY
    end
  end

  describe '#working_bikes' do
    it 'shows the working bikes' do
      expect(garage.working_bikes).to eq []
    end
  end

  describe '#fix' do
    it 'makes the bike work' do
      garage.received_bikes << bike
      allow(bike).to receive(:fixed) { bike }
      garage.fix
      expect(garage.working_bikes).to eq [bike]
    end
  end
end
