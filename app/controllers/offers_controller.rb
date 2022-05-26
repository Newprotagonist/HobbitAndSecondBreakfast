class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:offer_price].present? || params[:offer_location].present?
      if params[:offer_price].to_i.zero? && params[:offer_location].present?
        @offers = policy_scope(Offer).where(id: params[:offer_location])
      elsif !params[:offer_price].to_i.zero? && !params[:offer_location].present?
        @offers = policy_scope(Offer).where("price < ?", params[:offer_price])
      else
        @offers = policy_scope(Offer).where(id: params[:offer_location]).where("price < ?", params[:offer_price])
      end
    else
      @offers = policy_scope(Offer)
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @user = current_user
    authorize @offer
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(params_require)
    @offer.user = current_user
    authorize @offer
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def update
    @offer = Offer.find(params[:id])
    authorize @offer
    parameters = params_require
    parameters.delete(:photos) if parameters[:photos].delete_if(&:blank?).empty?
    if @offer.update(parameters)
      redirect_to offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.destroy
    redirect_to offers_path, status: :see_other
  end

  private

  def params_require
    params.require(:offer).permit(:location, :price, :summary, :user_id, photos: [])
  end
end
