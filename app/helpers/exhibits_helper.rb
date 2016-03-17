module ExhibitsHelper
  def all_exhibits(include_disabled=false)
    wheres = {}
    wheres[:enable] = true unless include_disabled
    Exhibit.where(wheres).order(:order)
  end
end
