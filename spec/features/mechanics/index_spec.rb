require 'rails_helper'

RSpec.describe 'Mechanics index' do
  before :each do
    @bob = Mechanic.create!(name: 'Bob', years_of_experience: 5)
    @maryam = Mechanic.create!(name: 'Maryam', years_of_experience: 7)
  end

  describe 'as a user' do
    it 'shows mechanic info for all mechanics' do
      visit '/mechanics'

      expect(page).to have_content('All Mechanics')

      within("#mechanic-#{@bob.id}") do
        expect(page).to have_content(@bob.name)
        expect(page).to have_content(@bob.years_of_experience)
      end

      within("#mechanic-#{@maryam.id}") do
        expect(page).to have_content(@maryam.name)
        expect(page).to have_content(@maryam.years_of_experience)
      end
    end

    it 'shows average years of experience over all mechanics' do
      visit '/mechanics'

      within('#average-experience') do
        expect(page).to have_content('6')
      end
    end
  end
end
