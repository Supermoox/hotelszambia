class MyAccommodationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @desired_id = current_user.id
    @accommodations = Accommodation.where(user_id: @desired_id).order("created_at DESC")
  end
end
