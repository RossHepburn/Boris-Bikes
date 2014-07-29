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

	it "knows its full" do
		expect(holder.full?).to be_false
		fill_holder(holder)
		expect(holder.full?).to be_true
	end

	it "does not dock a bike if full" do
		fill_holder(holder)
		expect{holder.dock(bike)}.to raise_error(RuntimeError)
	end

	it "knows its empty" do
		expect(holder.empty?).to be_true
	end

	it "does not release a bike if empty" do
		expect{holder.empty_holder(bike)}.to raise_error(RuntimeError)
	end


end
