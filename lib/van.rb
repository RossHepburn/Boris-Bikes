class Van

	include BikeContainer

	def initialize(options = {})
		@capacity = 25
		self.capacity = options.fetch(:capacity, capacity) 
	end
end