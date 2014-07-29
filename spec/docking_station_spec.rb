require './lib/docking_station'

describe DockingStation do
    
  let(:station) { DockingStation.new(:capacity => 123) }

  it "should allow setting default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end

  it "should know if the station is empty" do
  	station.dock(Bike.new)
  	expect(station).not_to be_empty
  end

  it "should provide a list of broken bikes" do 
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break
		station.dock(broken_bike)
		station.dock(working_bike)
		expect(station.broken_bikes).to eq [broken_bike]
	end

	it "should release broken bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break
		station.dock(broken_bike)
		station.dock(working_bike)
		station.release_broken
		expect(station.broken_bikes).to be_empty
	end

end
