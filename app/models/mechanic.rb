class Mechanic < ApplicationRecord
  has_many :mechanic_assignments
  has_many :rides, through: :mechanic_assignments

  def self.average_experience
    average(:years_of_experience)
  end
end
