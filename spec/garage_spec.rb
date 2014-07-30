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

  it "fixes broken bikes" do
  	broken_bike.break
  	garage.dock(broken_bike)
  	garage.fix_broken_bikes
  	expect(garage.available_bikes.count).to eq(1)
  end
end

