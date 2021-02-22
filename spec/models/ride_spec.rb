require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should have_many :mechanic_assignments }
    it { should have_many(:mechanics).through(:mechanic_assignments) }
  end
end
