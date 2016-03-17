module ExhibitsHelper
  def all_exhibits(include_disabled=false)
    Exhibit.ordered_exhibits(include_disabled)
  end
end
