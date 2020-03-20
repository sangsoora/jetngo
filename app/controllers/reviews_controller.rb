
class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to booking_path(@booking)        respond_to do |format|
        format.html { redirect_to booking_path(@booking) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else      else
      render :new       respond_to do |format|
        format.html { render 'bookings/show' }
        format.js  # <-- idem
      end

  end

  def destroy
    @review.destroy
    redirect_to booking_path(@review.booking)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :booking_id)
  end
end
