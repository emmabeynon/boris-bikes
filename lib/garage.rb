require_relative 'bike'

class Garage

  attr_reader :received_bikes, :working_bikes, :broken_bike

  def initialize
    @received_bikes = []
    @working_bikes = []
  end

  def fix
    bike = @received_bikes.pop
    bike.fixed
    @working_bikes << bike
  end

end
