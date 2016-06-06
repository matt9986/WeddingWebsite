class Tour < ActiveRecord::Base
  validates_presence_of :title
  has_many :tour_guests
  has_many :guests, through: :tour_guests

  accepts_nested_attributes_for :guests,
    reject_if: proc {|attributes| attributes["first"].blank? || attributes["last"].blank?}
end
