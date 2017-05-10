require_relative 'bike'

class DockingStation
  attr_reader :bike, :bike_docked
  def initialize
    @bike_docked = false
  end

  def release_bike
    raise "No bike available!" unless @bike_docked
    @bike_docked = false
    @bike
  end

  def dock_bike(bike)
    @bike = bike
    @bike_docked = true
  end
end
