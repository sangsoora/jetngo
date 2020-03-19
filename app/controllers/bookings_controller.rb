class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  def show
    @markers = [{
      lat: @booking.jet.city.latitude,
      lng: @booking.jet.city.longitude,
      image_url: helpers.asset_url('logo.jpg')
    }]
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
    @days = @booking.end_date - @booking.start_date + 1
    @total_price = @days * @jet.unit_price
    @booking.total_price = @total_price
    @booking.status = "Send"
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
