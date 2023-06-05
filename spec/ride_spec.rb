require 'spec_helper'

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({ name: 'Walnut Creek Trail', distance: 10.7, loop: false, terrain: :hills })
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@ride1).to be_an_instance_of(Ride)
    end

    it 'returns correct attributes' do
      expect(@ride1.name).to eq('Walnut Creek Trail')
      expect(@ride1.distance).to eq(10.7)
      expect(@ride1.loop).to eq(false)
      expect(@ride1.terrain).to eq(:hills)
    end
  end

  describe 'total_distance' do
    it 'returns correct total distance with no loop' do
      expect(@ride1.total_distance).to eq(21.4)
    end
  end
end
