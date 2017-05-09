require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}
  it "checks if it gets a working bike" do
    expect(DockingStation.new.release_bike.working?).to eq true
  end
  it "allows a bike to be docked" do
    station = DockingStation.new
    station.dock_bike(Bike.new)
    expect(station.bike_docked).to eq true
  end
  it "Has a method to make docking a bike possible" do
    expect(DockingStation.new.respond_to?("dock_bike")).to eq true
  end
  it "Uses an attr_reader to check if a bike is docked" do
    expect(DockingStation.new.respond_to?("bike_docked")).to eq true
  end
end
