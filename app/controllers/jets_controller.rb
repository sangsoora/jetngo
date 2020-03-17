class JetsController < ApplicationController
  before_action :set_jet, only: %i[show edit update destroy]
  def index
    @jets = Jet.all
  end

  def show
    @jet = Jet.find(params[:id])
  end

  def new
    @jet = Jet.new
  end

  def create
    @jet = Jet.new(jet_params)
    if @jet.save
      redirect_to jet_path(@jet)
    else
      render :new
    end
  end

  private

  def set_jet
    @jet = Jet.find(params[:id])
  end

  def jet_params
    params.require(:jet).permit(:name, :model, :capacity, :unit_price,:user_id, :city_id)
  end
end
