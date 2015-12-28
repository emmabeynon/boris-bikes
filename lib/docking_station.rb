require_relative 'bike'
require_relative 'van'
require_relative 'garage'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :broken_bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
    @broken_bikes = []
  end

  def release_bike
    fail 'No bikes available!' if empty?
    fail 'No working bikes available' if no_working_bikes?
    bikes.pop
  end

  def dock(bike)
    fail 'Dock is already full' if full?
    bikes << bike
  end

  def release_broken_bike
    fail 'No broken bikes available!' if no_broken_bikes?
    bikes.each { |bike| @broken_bikes << bike if bike.broken? }
    bikes.delete_if { |bike| bike.broken? }
  end

# private

attr_reader :bikes

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end

  def no_broken_bikes?
    all_broken_bikes = bikes.select { |bike| bike.broken? }
    all_broken_bikes.empty?
  end

  def no_working_bikes?
    all_working_bikes = bikes.select { |bike| bike.working? }
    all_working_bikes.empty?
  end
end
