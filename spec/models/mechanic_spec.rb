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
end
