class Van

	include BikeContainer

	def initialize(options = {})
		@capacity = 25
		self.capacity = options.fetch(:capacity, capacity) 
	end

	def dropoff_working_bikes_to(station)
		self.available_bikes.each {|bike| self.release(bike); station.dock(bike)}
	end

end