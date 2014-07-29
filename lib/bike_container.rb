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

  def dock(bike)
    raise_error_if_not_a(bike)
    raise "Station is full" if full?
    bikes << bike
  end

  def release(bike)
    raise "There are no bikes available" if bikes == []
    raise_error_if_not_a(bike)
    bikes.delete(bike) if bike.broken? == false
  end

  def raise_error_if_not_a(bike)
    raise "You can only perform this on bikes" if bike.class != Bike
  end

  def full?
    bikes.count == capacity
  end

  def available_bikes
    bikes.reject(&:broken?)
  end

  def broken_bikes
    bikes.select(&:broken?)
  end

  def broken?
    @broken
  end
end