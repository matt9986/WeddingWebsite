class TourGuest < ActiveRecord::Base
  belongs_to :tour
  belongs_to :guest
end
