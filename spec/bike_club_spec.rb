require 'spec_helper'

RSpec.describe BikeClub do
  before(:each) do
    @bike_club1 = BikeClub.new('Touring with Turing')
    @bike_club2 = BikeClub.new('Bike Party')
    @biker1 = Biker.new('Kenny', 30)
    @biker2 = Biker.new('Athena', 35)
    @biker3 = Biker.new('Steve', 40)
    @ride1 = Ride.new({ name: 'Walnut Creek Trail', distance: 10.7, loop: false, terrain: :hills })
    @ride2 = Ride.new({ name: 'Town Lake', distance: 14.9, loop: true, terrain: :gravel })
    @biker1.learn_terrain!(:gravel)
    @biker1.learn_terrain!(:hills)
    @biker2.learn_terrain!(:gravel)
    @biker2.learn_terrain!(:hills)
    @biker3.learn_terrain!(:gravel)
    @biker3.learn_terrain!(:hills)
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

      expect(@bike_club1.biker_with_most_rides).to eq(@biker1.name)
    end

    it 'can return a two way tie' do
      @bike_club1.add_biker(@biker1)
      @bike_club1.add_biker(@biker2)

      @biker1.log_ride(@ride1, 92.5)
      @biker1.log_ride(@ride1, 91.1)

      @biker2.log_ride(@ride1, 93.0)
      @biker2.log_ride(@ride1, 92.9)

      expect(@bike_club1.biker_with_most_rides).to eq("#{@biker1.name} and #{@biker2.name} are tied")
    end
    it 'can return a three way tie' do
      @bike_club1.add_biker(@biker1)
      @bike_club1.add_biker(@biker2)
      @bike_club1.add_biker(@biker3)

      @biker1.log_ride(@ride1, 92.5)
      @biker1.log_ride(@ride1, 91.1)

      @biker2.log_ride(@ride1, 93.0)
      @biker2.log_ride(@ride1, 92.9)

      @biker3.log_ride(@ride1, 93.0)
      @biker3.log_ride(@ride1, 92.9)

      expect(@bike_club1.biker_with_most_rides).to eq("#{@biker1.name} and #{@biker2.name} and #{@biker3.name} are tied")
    end
  end

  describe '#fastest_biker_for_ride' do
    it 'can return the fastest biker' do
      @bike_club1.add_biker(@biker1)
      @bike_club1.add_biker(@biker2)

      @biker1.log_ride(@ride1, 92.5)
      @biker1.log_ride(@ride1, 92.5)
      @biker1.log_ride(@ride2, 60.1)
      @biker1.log_ride(@ride2, 61.3)

      @biker2.log_ride(@ride1, 93.0)
      @biker2.log_ride(@ride1, 92.9)
      @biker2.log_ride(@ride2, 59.8)
      @biker2.log_ride(@ride2, 60.4)

      expect(@bike_club1.fastest_biker_for_ride(@ride1)).to eq(@biker1.name)
      expect(@bike_club1.fastest_biker_for_ride(@ride2)).to eq(@biker2.name)
    end

    it 'can return a two way tie' do
      @bike_club1.add_biker(@biker1)
      @bike_club1.add_biker(@biker2)

      @biker1.log_ride(@ride1, 92.5)
      @biker1.log_ride(@ride1, 92.5)
      @biker1.log_ride(@ride2, 60.1)
      @biker1.log_ride(@ride2, 61.3)

      @biker2.log_ride(@ride1, 92.5)
      @biker2.log_ride(@ride1, 92.5)
      @biker2.log_ride(@ride2, 60.1)
      @biker2.log_ride(@ride2, 61.3)

      expect(@bike_club1.fastest_biker_for_ride(@ride1)).to eq("#{@biker1.name} and #{@biker2.name} are tied")
    end

    it 'can return a three way tie' do
      @bike_club1.add_biker(@biker1)
      @bike_club1.add_biker(@biker2)
      @bike_club1.add_biker(@biker3)

      @biker1.log_ride(@ride1, 92.5)
      @biker1.log_ride(@ride1, 92.5)
      @biker1.log_ride(@ride2, 60.1)
      @biker1.log_ride(@ride2, 61.3)

      @biker2.log_ride(@ride1, 92.5)
      @biker2.log_ride(@ride1, 92.5)
      @biker2.log_ride(@ride2, 60.1)
      @biker2.log_ride(@ride2, 61.3)

      @biker3.log_ride(@ride1, 92.5)
      @biker3.log_ride(@ride1, 92.5)
      @biker3.log_ride(@ride2, 60.1)
      @biker3.log_ride(@ride2, 61.3)

      expect(@bike_club1.fastest_biker_for_ride(@ride1)).to eq("#{@biker1.name} and #{@biker2.name} and #{@biker3.name} are tied")
    end
  end

  describe '#eligible_bikers_for_ride' do
    it 'can return the eligible bikers' do
      @bike_club1.add_biker(@biker1)
      @bike_club1.add_biker(@biker2)
      @bike_club1.add_biker(@biker3)

      expect(@bike_club1.eligible_bikers_for_ride(@ride1)).to eq([@biker1, @biker2, @biker3])
    end
  end
end
