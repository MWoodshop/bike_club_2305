require 'spec_helper'

RSpec.describe BikeClub do
  before(:each) do
    @bike_club1 = BikeClub.new('Touring with Turing')
    @bike_club2 = BikeClub.new('Bike Party')
    @biker1 = Biker.new('Kenny', 30)
    @biker2 = Biker.new('Athena', 15)
    @ride1 = Ride.new({ name: 'Walnut Creek Trail', distance: 10.7, loop: false, terrain: :hills })
    @biker1.learn_terrain!(:gravel)
    @biker1.learn_terrain!(:hills)
    @biker2.learn_terrain!(:gravel)
    @biker2.learn_terrain!(:hills)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@bike_club1).to be_an_instance_of(BikeClub)
    end
  end

  describe '#add_biker' do
    it 'can add bikers' do
      expect(@bike_club1.bikers).to eq([])

      @bike_club1.add_biker(@biker1)

      expect(@bike_club1.bikers).to eq([@biker1])
    end
  end

  describe '#biker_with_most_rides' do
    it 'can return the biker with the most rides' do
      @bike_club1.add_biker(@biker1)
      @bike_club1.add_biker(@biker2)
      
      @biker1.log_ride(@ride1, 92.5)
      @biker1.log_ride(@ride1, 91.1)
      @biker1.log_ride(@ride1, 90.0)

      @biker2.log_ride(@ride1, 93.0)
      @biker2.log_ride(@ride1, 92.9)

      expect(@bike_club1.biker_with_most_rides).to eq('Kenny')
    end
  end
end
