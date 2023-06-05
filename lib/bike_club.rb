class BikeClub
  attr_reader :name, :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  def biker_with_most_rides
    @bikers.max_by { |biker| biker.rides.values.flatten.count }.name
  end
end
