require_relative 'bike_container'
require_relative 'bike'

class Van

	include BikeContainer

	def collect_available_bikes_from(station)
		station.available_bikes.each do |bike|
			station.release(bike)
			self.dock(bike)
		end
	end

		# def dropoff_fixed_bikes(station)
		# 	van.available_bikes.each do |bike|
		# 		van.release(bike)
		# 		self.dock(bike)
		# 	end
		# end


end
