require './lib/bike_container'

	class ContainerHolder
    include BikeContainer
  end

  describe BikeContainer do

    let(:bike) {Bike.new}
    let(:holder) {ContainerHolder.new}

  context "with a working and a fixed bike" do

    before do
      @working_bike, @broken_bike = Bike.new, Bike.new    
      @broken_bike.break      
    end

    it "should provide the list of available bikes" do
      holder.dock(@working_bike)
      holder.dock(@broken_bike)
      expect(holder.available_bikes).to include(@working_bike)
    end

    it "should provide a list of broken bikes" do
      holder.dock(@working_bike)
      holder.dock(@broken_bike)
      expect(holder.broken_bikes).to eq([@broken_bike])
    end
    
  end

  it "should accept a bike" do        
    expect(holder.bikes.count).to eq(0)
    holder.dock(bike)    
    expect(holder.bikes.count).to eq(1)
  end

  it "should release a bike" do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bikes.count).to eq(0)
  end

  it "should know when it's full" do
    expect(holder).not_to be_full
    fill_holder holder
    expect(holder).to be_full
  end

  it "should not accept a bike if it's full" do
    fill_holder holder
    expect{ holder.dock(bike) }.to raise_error(RuntimeError)
  end

  it "should raise an error if we try to release a bike that's not there" do
    expect{ holder.release(bike) }.to raise_error(RuntimeError)
  end

  it "should raise an error if we try to release something that's not a bike" do
    holder.dock(bike)
    expect{ holder.release("not a bike") }.to raise_error(RuntimeError)
  end

  it "should raise an error if you try to dock something that's not a bike " do
    expect { holder.dock("not a bike") }.to raise_error(RuntimeError)
  end

  def fill_holder(holder)
    holder.capacity.times { holder.dock(Bike.new) }
  end
end