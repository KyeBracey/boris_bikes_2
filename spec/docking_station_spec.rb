require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}
  it "checks if it gets a bike" do
    expect(DockingStation.new.release_bike.working?).to be_truthy
  end
end
