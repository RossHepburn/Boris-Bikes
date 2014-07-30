require 'bike'
require 'bikeContainer'
require 'dockingStation'
require 'van'
require 'garage'
describe Van do 
	let (:station) {DockingStation.new}
	let (:van) {Van.new}
	let (:working_bike) {Bike.new}
	let (:broken_bike) {Bike.new}
	let (:garage) {Garage.new}

	it "intitialises with default capacity" do
		expect(van.capacity).to eq(25)
	end

	context "dealing with broken bikes" do

		before do
			broken_bike.break
		end

		
		it "picks up bikes from dock" do
			station.dock(broken_bike)
			van.pickup_broken_bikes_from(station)
			expect(van.bikes).to include(broken_bike)
		end

		it "drops off bikes to the garage" do
			van.dock(broken_bike)
			van.dropoff_broken_bikes_to(garage)
			expect(van.bikes).to be_empty
			expect(garage.bikes).to include(broken_bike)
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