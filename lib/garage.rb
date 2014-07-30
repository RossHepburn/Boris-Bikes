require 'bikeContainer'

class Garage

	include BikeContainer

DEFAULT_CAPACITY = 50

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def fix_broken_bikes
		bikes.each {|bike| bike.fix}
	end
end