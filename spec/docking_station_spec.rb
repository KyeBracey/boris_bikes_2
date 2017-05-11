require 'docking_station'

describe DockingStation do
  # Retained multi-line syntax for comparison:
  # it 'Docking station releases a bike' do
  #   expect(release_bike()).to eq false
  # end
  it { expect(subject).to respond_to :release_bike }
end

describe DockingStation do

  # You can 'expect' multiple outcomes within the same test,
  # but it still counts as one test!  All the expectations must be met
  # to get one pass when running rspec.
  # Note: This is based on incorrectly setting up a full station,
  # and recording the bikes as an integer rather than an array.

  # it "reset bikes" do
  #   20.times{subject.release_bike}
  #   expect(subject.dock_bike(Bike.new).count).to eq 1
  #   expect(subject.dock_bike(Bike.new).count).to eq 2
  # end

 it "Releases a working bike" do
   subject.dock_bike(Bike.new)
   expect(subject.release_bike).to be_working
 end

 it "Raises an exception if trying to release a bike from empty station" do
   expect {subject.release_bike}.to raise_error("No bikes available")
 end

 it {is_expected.to respond_to(:dock_bike).with(1).argument}
 it {is_expected.to respond_to(:bikes)}

 it "Docks something" do
   expect(subject.dock_bike(Bike.new).count).to eq 1
 end

 it "Returns bikes at docking station" do
   test_bike = Bike.new
   subject.dock_bike(test_bike)
   expect(subject.release_bike).to eq test_bike
 end

 it "Raises an exception if attempting to dock a bike at a full station" do
   DockingStation::DEFAULT_CAPACITY.times{subject.dock_bike(Bike.new)}
   expect{subject.dock_bike(Bike.new)}.to raise_error("Docking station full")
 end

 it "Allows up to 20 bikes to be docked at one time" do
   expect(DockingStation::DEFAULT_CAPACITY.times {subject.dock_bike(Bike.new).count}).to eq DockingStation::DEFAULT_CAPACITY
 end

 it "Allows user to set a capacity when creating a new docking station" do
   docking_station = DockingStation.new(30)
   expect(docking_station.capacity).to eq 30
 end

 it "Allows user to set up a docking station without specifying a capacity" do
   expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
 end

end
