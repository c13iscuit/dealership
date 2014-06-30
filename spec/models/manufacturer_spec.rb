require 'rails_helper'

RSpec.describe Manufacturer, :type => :model do
  describe 'Associations' do

    it 'associates manufacturer with many cars' do
      car = FactoryGirl.create(:car)
      car.manufacturer.cars.count.should == 1
    end
  end

  it 'creates a new full entry' do
    FactoryGirl.create(:manufacturer).should be_valid
  end

  it 'requires name' do
    manufacturer = FactoryGirl.build(:manufacturer, name: nil)
    expect(manufacturer.valid?) == false
  end

  it 'requires country' do
    manufacturer = FactoryGirl.build(:manufacturer, country: nil)
    expect(manufacturer.valid?) == false
  end
end

