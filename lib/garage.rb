require_relative 'bike'

class Garage

  DEFAULT_CAPACITY = 15
  attr_reader :received_bikes, :working_bikes, :broken_bike, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @received_bikes = []
    @working_bikes = []
    @capacity = capacity
  end

  def fix
    bike = @received_bikes.pop
    bike.fixed
    @working_bikes << bike
  end

end
