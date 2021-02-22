require 'rails_helper'

RSpec.describe 'Mechanics index' do
  before :each do
    bob = Mechanic.create!(name: 'Bob', years_of_experience: 5)
    maryam = Mechanic.create!(name: 'Maryam', years_of_experience: 7)
  end

  describe 'as a user' do
    it 'shows list of all mechanics' do
      visit '/mechanics'

      expect(page).to have_content('All Mechanics')

      within('#mechanic-list') do
        expect(page).to have_content('Bob')
        expect(page).to have_content('Maryam')
      end
    end

    xit 'shows mechanic info' do

    end

    xit 'shows average years of experience over all mechanics' do

    end
  end
end
