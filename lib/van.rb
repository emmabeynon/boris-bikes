class Van

attr_reader :loaded_bikes

  def initialize
    @loaded_bikes = []
  end

  def load(station)
    @loaded_bikes << station.broken_bikes
  end

  # def release_broken_bike(station)
  #   station.bikes.pop
  # end
end
