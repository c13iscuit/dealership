require 'rails_helper'

RSpec.describe Car, :type => :model do
  describe 'Associations' do

    it 'associates car with manufacturer' do
      car = FactoryGirl.create(:car)
      car.manufacturer_id.should == 1
    end
  end

  it 'creates a new full entry' do
    FactoryGirl.create(:car).should be_valid
  end

  it 'requires year' do
    car = FactoryGirl.build(:car, year: nil)
    expect(car.valid?) == false
  end

  it 'requires mileage' do
    car = FactoryGirl.build(:car, mileage: nil)
    expect(car.valid?) == false
  end

  it 'requires color' do
    car = FactoryGirl.build(:car, color: nil)
    expect(car.valid?) == false
  end

  it 'requires manufacturer' do
    car = FactoryGirl.build(:car, manufacturer_id: nil)
    expect(car.valid?) == false
  end

  it 'does not require a description' do
    car = FactoryGirl.build(:car, description: nil)
    expect(car.valid?) == true
  end
end
