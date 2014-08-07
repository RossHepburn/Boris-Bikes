require 'bikeContainer'

class Garage

	include BikeContainer

def initialize(options = {})
		@capacity = 50
		self.capacity = options.fetch(:capacity, capacity) 
	end

	def fix_broken_bikes
		bikes.each {|bike| bike.fix}
	end
end