class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @jets = @user.jets
    @booking_requests = @user.booking_requests
    @bookings = @user.bookings
  end
end
