class DashboardsController < ApplicationController
  def show
    @jets = current_user.jets
    @bookings = current_user.bookings
  end
end
