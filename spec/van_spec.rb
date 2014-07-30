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
end