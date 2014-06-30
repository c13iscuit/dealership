require 'rails_helper'

feature 'user adds a new car', %Q{
As a car salesperson
I want to record a newly acquired car
So that I can list it in my lot
} do

# I must specify the manufacturer, color, year, and mileage of the car.
# Only years from 1920 and above can be specified.
# I can optionally specify a description of the car.
# If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success
# If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
# Upon successfully creating a car, I am redirected back to the index of cars.

scenario 'user adds a new car and submits' do
  FactoryGirl.create(:manufacturer, name: 'Dodge')

  visit '/cars'
  click_on 'Add a car!'

  fill_in 'Year', with: 1998
  fill_in 'Mileage', with: 120000
  fill_in 'Color', with: 'Red'
  fill_in 'Description', with: 'Neon R/T'
  select 'Dodge', from: 'Manufacturer'

  click_on 'Create Car'

  expect(page).to have_content 'Dodge'
  expect(page).to have_content 'Neon'
  expect(page).to have_content '1998'
  end

scenario 'user adds a new car without a year' do
  FactoryGirl.create(:manufacturer, name: 'Dodge')

  visit '/cars'
  click_on 'Add a car!'

  fill_in 'Year', with: nil
  fill_in 'Mileage', with: 120000
  fill_in 'Color', with: 'Red'
  fill_in 'Description', with: 'Neon R/T'
  select 'Dodge', from: 'Manufacturer'

  click_on 'Create Car'

  expect(page).to have_content "can't be blank"
  end

scenario 'user adds a new car without a mileage' do
  FactoryGirl.create(:manufacturer, name: 'Dodge')

  visit '/cars'
  click_on 'Add a car!'

  fill_in 'Year', with: 1998
  fill_in 'Mileage', with: nil
  fill_in 'Color', with: 'Red'
  fill_in 'Description', with: 'Neon R/T'
  select 'Dodge', from: 'Manufacturer'

  click_on 'Create Car'

  expect(page).to have_content "can't be blank"
  end

scenario 'user adds a new car without a color' do
  FactoryGirl.create(:manufacturer, name: 'Dodge')

  visit '/cars'
  click_on 'Add a car!'

  fill_in 'Year', with: 1998
  fill_in 'Mileage', with: 120000
  fill_in 'Color', with: nil
  fill_in 'Description', with: 'Neon R/T'
  select 'Dodge', from: 'Manufacturer'

  click_on 'Create Car'

  expect(page).to have_content "can't be blank"
  end

scenario 'user adds a new car without a manufacturer' do
  FactoryGirl.create(:manufacturer, name: 'Dodge')

  visit '/cars'
  click_on 'Add a car!'

  fill_in 'Year', with: 1998
  fill_in 'Mileage', with: nil
  fill_in 'Color', with: 'Red'
  fill_in 'Description', with: 'Neon R/T'
  select nil, from: 'Manufacturer'

  click_on 'Create Car'

  expect(page).to have_content "can't be blank"
  end
end



