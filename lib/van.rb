require_relative 'garage'

class Van

DEFAULT_CAPACITY = 10
attr_reader :loaded_bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @loaded_bikes = []
    @capacity = capacity
  end

  def load(station)
    until station.broken_bikes.empty? do
      @loaded_bikes << station.broken_bikes.pop
      fail 'Van is full' if loaded_bikes.length == DEFAULT_CAPACITY
    end
  end

  def deliver(garage)
    until loaded_bikes.empty? do
      garage.received_bikes << loaded_bikes.pop
      fail 'Garage is full' if garage.received_bikes.length == Garage::DEFAULT_CAPACITY
    end
  end

  def collect(garage)
    until garage.working_bikes.empty? do
      @loaded_bikes << garage.working_bikes.pop
    end
  end

  def distribute(station)
    until loaded_bikes.empty? do
      station.dock(loaded_bikes.pop)
    end
  end

end
