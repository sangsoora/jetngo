class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  def index
    @bookings = current_user.bookings
    @past_bookings = @bookings.select{|booking| booking.end_date < Date.today}
    @upcoming_bookings = @bookings.select{|booking| booking.end_date >= Date.today}
  end

  def show
  end

  def new
    @booking = Booking.new
    @jet = Jet.find(params[:jet_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @jet = Jet.find(params[:jet_id])
    @booking.jet = @jet
    @booking.user = current_user
    @days = @booking.end_date - @booking.start_date
    @total_price = @days * @jet.unit_price
    @booking.total_price = @total_price
    @booking.status = "Pending"
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def update
    @booking.update(booking_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @booking.destroy
    redirect_to root_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :jet_id, :user_id, :status)
  end
end
