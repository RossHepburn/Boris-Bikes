require_relative '../lib/bike_container'
require_relative '../lib/van'
require_relative '../lib/docking_station'
require_relative '../lib/bike'

describe Van do 
	
	it "should collect broken bikes from a station" do 
		station = DockingStation.new
		van = Van.new
		available_bike = Bike.new
		station.dock(available_bike)
		van.collect_available_bikes_from(station)
		expect(van.bikes).to include(available_bike)
		expect(station).to be_empty

	end
end