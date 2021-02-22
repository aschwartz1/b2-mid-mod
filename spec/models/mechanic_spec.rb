require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :mechanic_assignments }
    it { should have_many(:rides).through(:mechanic_assignments) }
  end

  describe 'class methods' do
    it '::average_experience' do
      bob = Mechanic.create!(name: 'Bob', years_of_experience: 5)
      maryam = Mechanic.create!(name: 'Maryam', years_of_experience: 7)

      expect(Mechanic.average_experience).to eq(6)
    end
  end

  describe 'instance methods' do
    it '#open_rides' do
      maryam = Mechanic.create!(name: 'Maryam', years_of_experience: 7)
      boat_ride = Ride.create!(name: 'Boats', thrill_rating: 1, open: true)
      plane_ride = Ride.create!(name: 'Planes', thrill_rating: 9, open: true)
      car_ride = Ride.create!(name: 'Cars', thrill_rating: 5, open: false)
      maryam.rides << [boat_ride, plane_ride, car_ride]

      expect(maryam.open_rides).to eq([plane_ride, boat_ride])
    end
  end
end
