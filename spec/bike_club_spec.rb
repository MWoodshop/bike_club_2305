require 'spec_helper'

RSpec.describe BikeClub do
  before(:each) do
    @bike_club1 = BikeClub.new('Touring with Turing')
    @biker1 = Biker.new('Kenny', 30)
    @biker2 = Biker.new('Athena', 15)
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
end
