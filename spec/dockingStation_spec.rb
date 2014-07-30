require 'dockingStation'

describe DockingStation do
    
  let(:station) { DockingStation.new(:capacity => 123) }
  let(:bike) {Bike.new}

  it "sets default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end

  it "knows if it's empty" do
  	expect(station.empty?).to be_true
  end

  it "knows if it's not empty" do
  	station.dock(bike)
  	expect(station.empty?).to be_false
  end
end
