class Exhibit < ActiveRecord::Base
  def self.first_visible_exhibit
    ordered_exhibits(false).first || Missing::Exhibit.new
  end

  def self.ordered_exhibits(include_disabled=false)
    wheres = {}
    wheres[:enable] = true unless include_disabled
    Exhibit.where(wheres).order(:order)
  end
end
