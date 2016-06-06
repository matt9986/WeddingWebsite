class TourGuest < ActiveRecord::Base
  belongs_to :tour
  belongs_to :guest
  
  validates_presence_of :guest_id, :tour_id
end
