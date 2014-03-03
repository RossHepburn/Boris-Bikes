# link to the Bike class
require_relative "../lib/bike"

# we're describing the functionality of a specific class,  Bike
describe Bike do
	# this is a specific feature (behaviour)
	# that we expect to be present
	it "should not be broken after we create it" do
		bike = Bike.new # initialise a new object of Bike class
		# expect an instance of this class to have
		#a meethod "broken?" that should return false
		expect(bike).not_to be_broken
	end
end
