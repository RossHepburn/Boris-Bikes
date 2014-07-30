require 'bike'
require 'bikeContainer'
require 'dockingStation'
require 'van'
require 'garage'

describe Garage do 

	let (:van) {Van.new}
	let (:garage) {Garage.new}
	let (:broken_bike) {Bike.new}

	it "sets default capacity on initialising" do
    expect(garage.capacity).to eq(50)
  end

end

