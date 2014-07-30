require 'bikeContainer'

class Garage

	include BikeContainer

DEFAULT_CAPACITY = 50

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

end