class AmusementPark < ApplicationRecord
  has_many :rides

  def rides_alpha_sort
    rides.order(:name)
  end
end
