require_relative '../lib/Bike.rb'
require_relative '../lib/van.rb'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity, :broken_bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
    @broken_bikes = []
  end

  def release_bike
    fail 'No bikes available!' if empty?
    fail 'Bike is broken' if bikes.last.broken?
    bikes.pop
  end

  def dock(bike)
    fail 'Dock is already full' if full?
    bikes << bike
  end

  def release_broken_bike
    bikes.each do |bike|
      @broken_bikes << bike if bike.broken?
    end
    bikes.delete_if { |bike| bike.broken? }
  end


private

attr_reader :bikes

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end

end
