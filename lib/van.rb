class Van

attr_reader :loaded_bikes

  def initialize
    @loaded_bikes = []
  end

  def load(station)
    until station.broken_bikes.empty? do
      @loaded_bikes << station.broken_bikes.pop
    end
  end

  def deliver(garage)
    until loaded_bikes.empty? do
      garage.received_bikes << loaded_bikes.pop
    end
  end

  def collect(garage)
    until garage.working_bikes.empty? do
      @loaded_bikes << garage.working_bikes.pop
    end
  end
end
