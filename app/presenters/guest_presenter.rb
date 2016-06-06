class GuestPresenter < SimpleDelegator
  def fullname
    nick =  self.alias.blank? ? "" : ' "' + self.alias + '"'
    first + nick + ' ' + last
  end

  def rsvp_indicator_class
    accept? ? "green" : decline? ? "red" : ""
  end
end