require_relative 'bike_container'
require_relative 'bike'

class DockingStation 

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def empty?
		bikes == []
	end
end
