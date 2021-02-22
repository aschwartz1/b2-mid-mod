class Ride < ApplicationRecord
  has_many :mechanic_assignments
  has_many :mechanics, through: :mechanic_assignments
end
