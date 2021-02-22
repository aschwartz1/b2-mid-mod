class Mechanic < ApplicationRecord
  has_many :mechanic_assignments
  has_many :rides, through: :mechanic_assignments

  def self.average_experience
    average(:years_of_experience)
  end

  def open_rides
    rides.where(open: true).order(thrill_rating: :desc)
  end
end
