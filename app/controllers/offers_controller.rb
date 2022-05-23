class OffersController < ApplicationController
  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
    @user = User.find(params[:user_id])
  end

  def create
    @offer = Offer.new(params_require)
    @user = User.find(params[:user_id])
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(params_require)
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to offers_path, status: :see_other
  end

  private

  def params_require
    params.require(:offer).permit(:localisation, :price, :summary, :user_id)
  end

end
