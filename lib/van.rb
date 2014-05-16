class Van

	include BikeContainer

	def collect_available_bikes_from(station)
		station.available_bikes.each do |bike|
			station.release(bike)
			self.dock(bike)
			
		end
	end
end
