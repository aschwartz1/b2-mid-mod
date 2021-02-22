require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :mechanic_assignments }
    it { should have_many(:rides).through(:mechanic_assignments) }
  end
end
