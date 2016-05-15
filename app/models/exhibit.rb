class Exhibit < ActiveRecord::Base
  include FriendlyId
  friendly_id :title, use: [:slugged] # TODO: add history

  mount_uploader :photograph, PhotographUploader

  def self.first_visible_exhibit
    ordered_exhibits(false).first || Missing::Exhibit.new
  end

  def self.ordered_exhibits(include_disabled=false)
    wheres = {}
    wheres[:enable] = true unless include_disabled
    Exhibit.where(wheres).order(:order)
  end


  def should_generate_new_friendly_id?
    title_changed? || super
  end
end
