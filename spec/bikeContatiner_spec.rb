require 'bikeContainer'

class ContainerHolder;
	include BikeContainer;
end

describe BikeContainer do 

	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }

	def fill_holder(holder)
		holder.capacity.times { holder.dock(Bike.new) }
	end

	it "can dock a bike" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it "can release a bike" do
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end
end
