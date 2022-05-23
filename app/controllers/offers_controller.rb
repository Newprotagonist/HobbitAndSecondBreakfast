class OffersController < ApplicationController
  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(params_require)
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def updated
    @offer = Task.find(params[:id])
    @offer.update(params_require)
    if @offer.save
      redirect_to offer_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_require
    params.require(:offer).permit(:localisation, :price, :summary,)
  end

end
