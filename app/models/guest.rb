class Guest < ActiveRecord::Base
  validates_presence_of :first, :last
  has_one :tour_guest
  has_one :tour, through: :tour_guest
  accepts_nested_attributes_for :tour_guest, update_only: true, reject_if: :all_blank
  enum rsvp: {unknown: 0, decline: 1, accept: 2}

  def self.lookup_by_name_or_alias(first, last)
    where(last: last).where("first LIKE ? OR alias LIKE ?", first, first)
  end
end
