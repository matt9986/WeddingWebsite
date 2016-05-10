module PhrasingHelper
  # You must implement the can_edit_phrases? method.
  # Example:
  #
  # def can_edit_phrases?
  #  current_user.is_admin?
  # end

  def can_edit_phrases?
    puts user_signed_in?
    user_signed_in? && current_user.in_wedding_party?
  end
end
