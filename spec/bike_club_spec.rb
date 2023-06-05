require 'spec_helper'

RSpec.describe BikeClub do
  before(:each) do
    @bike_club1 = BikeClub.new('Touring with Turing')
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@bike_club1).to be_an_instance_of(BikeClub)
    end
  end
end
