require 'spec_helper'

RSpec.describe Ride do
  it 'can initialize' do
    ride1 = Ride.new({ name: 'Walnut Creek Trail', distance: 10.7, loop: false, terrain: :hills })

    expect(ride1).to be_an_instance_of(Ride)
  end
end
