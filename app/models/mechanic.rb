class Mechanic < ApplicationRecord
  has_many :mechanic_assignments
  has_many :rides, through: :mechanic_assignments
end
