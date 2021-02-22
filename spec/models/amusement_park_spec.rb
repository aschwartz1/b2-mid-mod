require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many :rides }
  end

  describe 'instance methods' do
    it '#rides_alpha_sort' do
      park = AmusementPark.create!(name: 'Very Fun Park', admission_price: 50.00)
      boat_ride = Ride.create!(name: 'Boats', thrill_rating: 1, open: true)
      plane_ride = Ride.create!(name: 'Planes', thrill_rating: 9, open: true)
      car_ride = Ride.create!(name: 'Cars', thrill_rating: 5, open: false)
      park.rides << [boat_ride, plane_ride, car_ride]

      expect(park.rides_alpha_sort).to eq([boat_ride, car_ride, plane_ride])
    end
  end
end
