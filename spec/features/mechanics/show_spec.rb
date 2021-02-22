require 'rails_helper'

RSpec.describe 'Mechanics show' do
  before :each do
    @maryam = Mechanic.create!(name: 'Maryam', years_of_experience: 7)
    @boat_ride = Ride.create!(name: 'Boats', thrill_rating: 1, open: true)
    @plane_ride = Ride.create!(name: 'Planes', thrill_rating: 9, open: true)
    @car_ride = Ride.create!(name: 'Cars', thrill_rating: 5, open: false)
    @maryam.rides << [@boat_ride, @plane_ride, @car_ride]
  end

  it 'shows mechanic info' do
    visit "/mechanics/#{@maryam.id}"

    within("#info") do
      expect(page).to have_content(@maryam.name)
      expect(page).to have_content(@maryam.years_of_experience)
    end
  end

  it "shows sorted (descending thrill) list of open rides they're working on" do
    visit "/mechanics/#{@maryam.id}"

    within('#ride-assignments') do
      actual_rides = page.all('.ride').map(&:text)
      expect(actual_rides).to eq([@plane_ride.name, @boat_ride.name])
    end
  end

  it 'shows a form to add a ride id to mechanic workload' do
    new_ride = Ride.create!(name: 'Super Fun Time', thrill_rating: 99, open: true)
    visit "/mechanics/#{@maryam.id}"

    within('#add-assignment') do
      fill_in(:ride_id, with: new_ride.id)
      click_on('Submit')
    end

    expect(current_path).to eq("/mechanics/#{@maryam.id}")

    within('#ride-assignments') do
      expect(page).to have_content('Super Fun Time')
    end
  end
end
