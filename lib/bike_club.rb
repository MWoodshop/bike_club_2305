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
    max_rides = @bikers.map { |biker| biker.rides.values.flatten.count }.max
    bikers_with_most_rides = @bikers.select { |biker| biker.rides.values.flatten.count == max_rides }

    if bikers_with_most_rides.size == 1
      bikers_with_most_rides.first.name
    else
      bikers_with_most_rides.map(&:name).join(' and ') + ' are tied'
    end
  end

  def fastest_biker_for_ride(ride)
    fastest_bikers = []
    fastest_time = nil

    @bikers.each do |biker|
      next unless biker.rides.key?(ride)

      best_biker_time = biker.personal_record(ride)
      if fastest_time.nil? || best_biker_time < fastest_time
        fastest_time = best_biker_time
        fastest_bikers = [biker]
      elsif best_biker_time == fastest_time
        fastest_bikers << biker
      end
    end

    if fastest_bikers.size == 1
      fastest_bikers.first.name
    else
      fastest_bikers.map(&:name).join(' and ') + ' are tied'
    end
  end
end
