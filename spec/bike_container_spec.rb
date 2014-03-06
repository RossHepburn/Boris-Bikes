require_relative '../lib/bike_container'
require_relative '../lib/bike'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }


	it "should accept a bike" do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

	it "should release a bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq(0)
	end

	it "should know when it is full" do
		expect(holder).not_to be_full
		fill_holder holder		
		expect(holder).to be_full
	end

	it "should not accept a bike when it is full" do
		fill_holder holder
		expect{ holder.dock(bike) }.to raise_error(RuntimeError)
	end

	it "should provide list of available bikes" do 
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	it "should not release bike if not there" do
		expect(lambda{ holder.release(bike) }).to raise_error(RuntimeError)
	end

	it "should raise an error if the argument is nil" do
		expect(lambda{ holder.release(nil) }).to raise_error(RuntimeError)
	end

	it "should raise an error if the argument is nil" do
		expect(lambda{ holder.dock(nil) }).to raise_error(RuntimeError)
	end

	it "should raise an error if argument is not a bike" do
		expect(lambda{ holder.dock("random") }).to raise_error(RuntimeError)
	end


	def fill_holder(holder)
		holder.capacity.times { holder.dock(Bike.new) }
	end

end