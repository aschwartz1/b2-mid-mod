class AmusementPark < ApplicationRecord
  has_many :rides

  def rides_alpha_sort
    rides.order(:name)
  end

  def average_thrill_rating
    rides.average(:thrill_rating)
  end
end
