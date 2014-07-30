require 'bike'
require 'bikeContainer'
require 'dockingStation'
require 'van'

describe Van do 
	let (:station) {DockingStation.new}
	let (:van) {Van.new}
	let (:working_bike) {Bike.new}
	let (:broken_bike) {Bike.new}

	it "intitialises with default capacity" do
		expect(van.capacity).to eq(25)
	end

	context "available bikes" do

		it "transports bikes to dock" do
			van.dock(working_bike)
			van.dropoff_working_bikes_to(station)
			expect(station.bikes).to include(working_bike)
			expect(van).to be_empty
		end
	end

end