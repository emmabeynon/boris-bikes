require 'docking_station'

describe DockingStation do
  subject(:station) { described_class.new}
  let(:bike) { double :bike }

  describe '#default' do
    it 'allows capacity to be set' do
      docking_station = described_class.new(50)
      expect(docking_station.capacity).to eq 50
    end

    it 'it sets a default cacpacity' do
      expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  describe '#release_bike' do
    context 'when working bikes are available' do
      it 'releases a working bike' do
        station.dock(bike)
        allow(bike).to receive(:working?) { true }
        allow(bike).to receive(:broken?) { false }
        expect(station.release_bike).to eq bike
      end
    end

    context 'when there are only broken bikes available' do
      it 'does not release a broken bike' do
        station.dock bike
        allow(bike).to receive(:working?) { false }
        message = 'No working bikes available'
        expect{station.release_bike}.to raise_error message
      end
    end

    context 'when there are no bikes available' do
      it 'raises an error' do
        message = 'No bikes available!'
        expect{station.release_bike}.to raise_error message
      end
    end
  end

  describe '#release_broken_bike' do
    it 'raises exception when there are no broken bikes available' do
      allow(bike).to receive(:broken?) { false }
      station.dock(bike)
      message = 'No broken bikes available!'
      expect{ station.release_broken_bike }.to raise_error message
    end

    it 'releases the broken bikes' do
      allow(bike).to receive(:broken?) { true }
      station.dock(bike)
      station.release_broken_bike
      expect(station.broken_bikes).to eq [bike]
    end

    it 'removes the broken bike from the docking station' do
      allow(bike).to receive(:broken?) { true }
      station.dock(bike)
      station.release_broken_bike
      message = 'No bikes available!'
      expect{station.release_bike}.to raise_error message
    end
  end

  describe '#dock' do
    it 'allows a bike to be docked' do
      allow(bike).to receive(:working?) { true }
      station.dock(bike)
      expect(station.release_bike).to eq bike
    end

    it 'raises an error if the dock is full' do
      station.capacity.times {station.dock(bike) }
      expect {station.dock(bike)}.to raise_error 'Dock is already full'
    end
  end

end
