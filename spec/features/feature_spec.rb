require 'van'
require 'DockingStation'
require 'Bike'
require 'garage'

describe 'User stories' do
  subject(:van) { Van.new }
  subject(:bike) { Bike.new }
  subject(:station) { DockingStation.new }
  subject(:garage) { Garage.new }

  describe 'DockingStation' do
    # As a person,
    # So that I can use a bike,
    # I'd like a docking station to release a bike.
    it 'releases a bike' do
      station.dock(bike)
      expect{station.release_bike}.not_to raise_error
    end

    # As a member of the public
    # So I can return bikes I've hired
    # I want to dock my bike at the docking station

    # As a maintainer of the system,
    # So that I can manage broken bikes and not disappoint users,
    # I'd like docking stations to accept returning bikes (broken or not).

    it 'docks a bike' do
      expect{station.dock(bike)}.not_to raise_error
    end

    # As a member of the public
    # So I can decide whether to use the docking station
    # I want to see a bike that has been docked
    it 'shows a docked bike' do
      expect(station.dock(bike)).to eq [bike]
    end

    # As a member of the public,
    # So that I am not confused and charged unnecessarily,
    # I'd like docking stations not to release bikes when there are none available.
    it 'does not release a bike when there are none available' do
      message = 'No bikes available!'
      expect{station.release_bike}.to raise_error message
    end

    # As a maintainer of the system,
    # So that I can control the distribution of bikes,
    # I'd like docking stations not to accept more bikes than their capacity.
    it 'does not accept more bikes than its capacity' do
      DockingStation::DEFAULT_CAPACITY.times { station.dock(bike) }
      message = 'Dock is already full'
      expect{station.dock(bike)}.to raise_error message
    end

    # As a system maintainer,
    # So that I can plan the distribution of bikes,
    # I want a docking station to have a default capacity of 20 bikes.
    it 'has a default capacity of 20 bikes' do
      expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    # As a system maintainer,
    # So that busy areas can be served more effectively,
    # I want to be able to specify a larger capacity when necessary.
    it 'has a specified capacity of 30 bikes' do
      docking_station = DockingStation.new(30)
      expect(docking_station.capacity).to eq 30
    end

    # As a maintainer of the system,
    # So that I can manage broken bikes and not disappoint users,
    # I'd like docking stations not to release broken bikes.
    it 'does not release broken bikes' do
      station.dock(bike)
      bike.report_broken
      message = 'No working bikes available'
      expect{station.release_bike}.to raise_error message
    end
  end

  describe 'Bike' do
    # As a person,
    # So that I can use a good bike,
    # I'd like to see if a bike is working
    it 'check that a bike is working' do
      expect(bike.working?).to eq true
    end

    # As a member of the public,
    # So that I reduce the chance of getting a broken bike in future,
    # I'd like to report a bike as broken when I return it.
    it 'reports a bike as broken' do
      bike.report_broken
      expect(bike.broken?).to eq true
    end
  end

  describe 'Van' do
    before do
      station.dock(bike)
      bike.report_broken
      station.release_broken_bike
    end
    # As a maintainer of the system,
    # So that I can manage broken bikes and not disappoint users,
    # I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.
    it 'takes broken bikes from docking stations' do
      van.load(station)
      expect(van.loaded_bikes).to eq [bike]
      expect(station.broken_bikes).to be_empty
    end

    it 'delivers broken bikes to the garage' do
      van.load(station)
      van.deliver(garage)
      expect(van.loaded_bikes).to be_empty
      expect(garage.received_bikes).to eq [bike]
    end

    # As a maintainer of the system,
    # So that I can manage broken bikes and not disappoint users,
    # I'd like vans to collect working bikes from garages and distribute them to docking stations.
    it 'collects working bikes from the garage' do
      van.load(station)
      van.deliver(garage)
      garage.fix
      van.collect(garage)
      expect(van.loaded_bikes).to eq [bike]
      expect(garage.working_bikes).to eq []
    end

    it 'distributes working bikes to docking stations' do
      van.load(station)
      van.deliver(garage)
      garage.fix
      van.collect(garage)
      van.distribute(station)
      expect(van.loaded_bikes).to be_empty
    end
  end
end
