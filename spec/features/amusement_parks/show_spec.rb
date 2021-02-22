require 'rails_helper'

RSpec.describe 'Amusement Parks show' do
  before :each do
    @park = AmusementPark.create!(name: 'Very Fun Park', admission_price: 50.00)
    @boat_ride = Ride.create!(name: 'Boats', thrill_rating: 1, open: true)
    @plane_ride = Ride.create!(name: 'Planes', thrill_rating: 9, open: true)
    @car_ride = Ride.create!(name: 'Cars', thrill_rating: 5, open: false)
    @park.rides << [@boat_ride, @plane_ride, @car_ride]
  end

  it 'shows park info' do
    visit "/amusement_parks/#{@park.id}"

    within('#info') do
      expect(page).to have_content('Very Fun Park')
      expect(page).to have_content('50.00')
    end
  end

  it 'shows sorted (alphabetically) list of rides in the park' do
    visit "/amusement_parks/#{@park.id}"

    within('#rides') do
      actual_rides = page.all('.ride').map(&:text)
      expect(actual_rides).to eq([@boat_ride.name, @car_ride.name, @plane_ride.name])
    end
  end

  it "shows average thrill rating for the park's rides" do
    visit "/amusement_parks/#{@park.id}"

    within('#average-thrill') do
      expect(page).to have_content('5')
    end
  end
end
