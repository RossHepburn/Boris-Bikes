require '../lib/docking_station'

describe DockingStation do
    
  let(:station) { DockingStation.new(:capacity => 123) }

  it "should allow setting default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end

  it "should know if the station is empty" do
  	station.dock(Bike.new)
  	expect(station).not_to be_empty
  end

end
