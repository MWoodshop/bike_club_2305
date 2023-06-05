class BikeClub
  attr_reader :name, :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  # def biker_with_most_rides
  #   @bikers.max_by { |biker| biker.rides.values.flatten.count }.name
  # end

  def biker_with_most_rides
    max_rides = @bikers.map { |biker| biker.rides.values.flatten.count }.max
    bikers_with_most_rides = @bikers.select { |biker| biker.rides.values.flatten.count == max_rides }

    if bikers_with_most_rides.size == 1
      bikers_with_most_rides.first.name
    else
      bikers_with_most_rides.map(&:name).join(' and ') + ' are tied'
    end
  end
end
