module BikeContainer

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		raise "Dock is full" if full?
		bikes << bike
	end

	def empty_holder(bike)
		raise "No bikes available" if empty?
	end

	def release(bike)
		bikes.delete(bike)
	end

	def full?
		bike_count() == @capacity
	end

	def empty?
		bike_count() == 0
	end

	def available_bikes
		bikes.reject {|bike| bike.broken? }
	end

	def broken_bikes
		bikes.select {|bike| bike.broken? }
	end



end
