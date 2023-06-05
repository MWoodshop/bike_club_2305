# Create a Biker with attributes and a way to read that data
# A Biker has a list of acceptable terrain and can learn new terrain
# Bikers can log a ride with a time. The Biker can keep track of all of its previous rides and times for those rides.
# A Biker will not log a ride if the ride's terrain does not match their acceptable terrain. They also won't log a ride if the ride's total distance is greater than the Biker's max distance.
# A Biker can report its personal record for a specific ride. This is the lowest time recorded for a ride. This method will return false if the Biker hasn't completed the ride

class Biker
  attr_reader :name, :max_distance, :rides, :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, time)
    return unless @acceptable_terrain.include?(ride.terrain) && ride.total_distance <= @max_distance

    @rides[ride] ||= []
    @rides[ride] << time
  end

  def personal_record(ride)
    return false unless @rides[ride]

    @rides[ride].min_by(&:to_f)
  end
end
