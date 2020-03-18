class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @jet = Jet.find(params[:jet_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @jet = Jet.find(params[:jet_id])
    @booking.jet = @jet
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
  end

  def delete
  end

  private
  def booking_params
    params.require(:booking).permit(:jet_id, :start_date, :end_date, :total_price)
  end
end
