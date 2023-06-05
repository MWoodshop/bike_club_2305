require 'spec_helper'

RSpec.describe Biker do
  before(:each) do
    @biker = Biker.new('Kenny', 30)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@biker).to be_an_instance_of(Biker)
    end
  end
end
