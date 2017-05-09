require 'docking_station'

describe DockingStation do
  # describe DockingStation.respond_to?(:release_bike) do
  #   it {is_expected.to eq true}
  # end
  it {is_expected.to respond_to :release_bike}

end
