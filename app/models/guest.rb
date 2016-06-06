class Guest < ActiveRecord::Base
  validates_presence_of :first, :last
  has_many :tour_guests
  has_one :tour, through: :tour_guests
  enum rsvp: {unknown: 0, decline: 1, accept: 2}

  def self.lookup_by_name_or_alias(first, last)
    where(last: last).where("first LIKE ? OR alias LIKE ?", first, first)
  end
end
