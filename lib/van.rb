class Van

	include BikeContainer

	def initialize(options = {})
		@capacity = 25
		self.capacity = options.fetch(:capacity, capacity) 
	end

	def pickup_broken_bikes_from(station)
		station.broken_bikes.each {|bike| station.release(bike); self.dock(bike)}
	end

	def dropoff_working_bikes_to(station)
		self.available_bikes.each {|bike| self.release(bike); station.dock(bike)}
	end

	def dropoff_broken_bikes_to(garage)
			self.broken_bikes.each {|bike| self.release(bike); garage.dock(bike)}
	end



end