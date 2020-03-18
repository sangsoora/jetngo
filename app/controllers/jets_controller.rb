class JetsController < ApplicationController
  before_action :set_jet, only: %i[show update destroy]
  def index
    @jets = Jet.all
  end

  def show
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
    params.require(:jet).permit(:name, :model, :capacity, :unit_price,:user_id, :city_id, photos: [])
  end
end
