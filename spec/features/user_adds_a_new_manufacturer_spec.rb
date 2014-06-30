require 'rails_helper'

feature 'user adds a new manufacturer', %Q{
As a car salesperson
I want to record a car manufacturer
So that I can keep track of the types of cars found in the lot
} do

# I must specify a manufacturer name and country.
# If I do not specify the required information, I am presented with errors.
# If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers

scenario 'user adds a new manufacturer and submits' do

  visit '/manufacturers'
  click_on 'Add a manufacturer!'

  fill_in 'Name', with: 'Ford'
  select 'United States of America', from: 'Country'

  click_on 'Create Manufacturer'

  expect(page).to have_content 'Ford'
  expect(page).to have_content 'United States of America'
  end

scenario 'user adds a new manufacturer without a name' do

  visit '/manufacturers'
  click_on 'Add a manufacturer!'

  fill_in 'Name', with: nil
  select 'United States of America', from: 'Country'

  click_on 'Create Manufacturer'

  expect(page).to have_content "can't be blank"
  end
end
