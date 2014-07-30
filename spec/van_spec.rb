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

	context "dealing with broken bikes" do

		before do
			broken_bike.break
		end

		
		it "picks up broken bikes from dock" do
			broken_bike.break
			station.dock(broken_bike)
			van.pickup_broken_bikes_from(station)
			expect(van.bikes).to include(broken_bike)
		end
	end

	context "dealing with available bikes" do

		it "drops off bikes to dock" do
			van.dock(working_bike)
			van.dropoff_working_bikes_to(station)
			expect(station.bikes).to include(working_bike)
			expect(van).to be_empty
		end
	end
end