class Guest < ActiveRecord::Base
  enum rsvp: {unknown: 0, decline: 1, accept: 2}

  def self.lookup_by_name_or_alias(first, last)
    where(last: last).where("first LIKE ? OR alias LIKE ?", first, first)
  end
end
