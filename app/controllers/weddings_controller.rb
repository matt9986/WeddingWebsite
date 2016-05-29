class WeddingsController < ApplicationController
  before_filter :user_in_wedding_party

  def index
    # TODO: Make this admin-only
    render "show"
  end

  private

  def user_in_wedding_party
    raise ActionController::RoutingError.new('Not Found') unless current_user.present? && current_user.in_wedding_party?
  end
end