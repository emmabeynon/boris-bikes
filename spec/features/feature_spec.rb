require 'van'
require 'DockingStation'
require 'Bike'

describe 'User stories' do
  subject(:van) { Van.new }
  subject(:bike) { Bike.new }
  subject(:station) { DockingStation.new }

  describe 'Van' do
    # As a maintainer of the system,
    # So that I can manage broken bikes and not disappoint users,
    # I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.
    it 'takes broken bikes from docking stations' do
      station.dock(bike)
      bike.report_broken
      station.release_broken_bike
      van.load(station)
      expect(van.loaded_bikes).to eq [bike]
    end

    it 'delivers broken bikes to the garage' do

    end
    # As a maintainer of the system,
    # So that I can manage broken bikes and not disappoint users,
    # I'd like vans to collect working bikes from garages and distribute them to docking stations.
    it 'collects working bikes from the garage' do

    end

    it 'distributes working bikes to docking stations' do

    end
  end
end
