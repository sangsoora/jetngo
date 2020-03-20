class JetsController < ApplicationController
  before_action :set_jet, only: %i[show update destroy]
  def index
    if params[:query].present?
      # sql_query = " \
      #     cities.name @@ :query \
      #     OR jets.model @@ :query \
      #     "
      # @jets = Jet.joins(:city).where(sql_query, query: "%#{params[:query]}%")
      @jets = Jet.search_by_name_and_model(params[:query])
    else
      @jets = Jet.all
    end

    @markers = @jets.map do |jet|
      {
        lat: jet.city.latitude,
        lng: jet.city.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { jet: jet }),
        image_url: helpers.asset_url('logo.jpg')
      }
    end
  end

  def show
    @booking = Booking.new
    @jet_reviews = @jet.jet_reviews
  end

  def new
    @jet = Jet.new
  end

  def create
    @jet = Jet.new(jet_params)
    @jet.user = current_user

    if @jet.save
      redirect_to jet_path(@jet)
    else
      render :new
    end
  end

  def update
    if @jet.update(jet_params)
      redirect_to jet_path(@jet)
    else
      render :edit
    end
  end

  def destroy
    @jet.destroy
    redirect_to root_path
  end

  private

  def set_jet
    @jet = Jet.find(params[:id])
  end

  def jet_params
    params[:jet][:name].capitalize!
    params[:jet][:model].capitalize!
    params.require(:jet).permit(:name, :model, :capacity, :unit_price, :description, :departure_time, :user_id, :city_id, photos: [])
  end
end
