require 'DockingStation'

describe DockingStation do
  subject(:station) { described_class.new}
  let(:bike) { double :bike }

  describe '#release_bike' do
    context 'when working' do
      it 'releases a working bike' do
        station.dock(bike)
        allow(bike).to receive(:working?) { true }
        allow(bike).to receive(:broken?) { false }
        expect(station.release_bike).to eq bike
      end
    end

    context 'when broken' do
      it 'does not release a broken bike' do
        station.dock bike
        allow(bike).to receive(:working?) { false }
        message = 'No working bikes available'
        expect {station.release_bike}.to raise_error message
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
  end

  describe '#empty?' do
    it 'raises exception when no bikes' do
      expect {station.release_bike}.to raise_error
    end
  end

  describe '#dock' do
    it 'allows a bike to be docked' do
      bike = double(:bike, broken?: false, working?: true)
      station.dock(bike)
      expect(station.release_bike).to eq bike
    end
  end

  describe '#full?' do
    it 'raises an error if the dock is full' do
      station.capacity.times {station.dock double :bike }
      expect {station.dock(:bike)}.to raise_error 'Dock is already full'
    end
  end

  describe 'capacity' do
    it 'allows capacity to be set' do
      docking_station = DockingStation.new(50)
      expect(docking_station.capacity).to eq 50
    end

    it 'it sets a default cacpacity' do
      expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end
end
