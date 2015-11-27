require 'DockingStation'
require 'Bike'

describe DockingStation do

    describe '#release_bike' do
          it { is_expected.to respond_to :release_bike }

          #let(:bike) {double :bike}
          it 'gets a bike and expects to be working' do
            bike = double(:bike, broken?: false, working?: true)
            #allow(bike).to receive(:working?).and_return(true)
            subject.dock bike
            expect(subject.release_bike).to eq bike
          end

          it 'does not release broken bikes' do
            bike = double(:bike, broken?: true)
            subject.dock bike
            expect {subject.release_bike}.to raise_error
          end

      end
      describe '#release_broken_bike' do
        it { is_expected.to respond_to  :release_broken_bike }


        it 'raises exception when no broken bikes' do
          bike = double(:bike, working?: false)
          subject.dock(bike)
          expect { subject.release_broken_bike }.to raise_error
      end
    end

    describe '#empty?' do
        it 'raises exception when no bikes' do
          expect {subject.release_bike}.to raise_error
        end
    end

    describe '#dock' do

      #let(:bike) {double :bike}
        it 'allows a bike to be docked' do
          bike = double(:bike, broken?: false, working?: true)
          subject.dock(bike)
          expect(subject.release_bike).to eq bike
        end

      end

    describe '#full?' do
        it 'raises an error if the dock is full' do
          subject.capacity.times {subject.dock double :bike }
          expect {subject.dock(:bike)}.to raise_error 'Dock is already full'
        end
    end


      it 'allows capacity to be set' do
        docking_station = DockingStation.new(50)
        expect(docking_station.capacity).to eq 50
      end


      it 'it sets a default cacpacity' do
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY

      end
end
