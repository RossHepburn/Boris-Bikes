require './lib/docking_station'

describe DockingStation do
    
  let(:station) { DockingStation.new(:capacity => 123) }
  let(:bike) {Bike.new}

  it "should allow setting default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end

  it "should know if the station is empty" do
  	expect(station.empty?).to be_true
  end

  it "should know if the station is not empty" do
  	station.dock(bike)
  	expect(station.empty?).to be_false
  end
end
