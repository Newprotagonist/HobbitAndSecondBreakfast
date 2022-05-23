class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]

  def show
  end

  def new
    @offer = Offer.find(params[:offer_id])
    @reservation = Reservation.new
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.offer = @offer
    if @reservation.save!
      redirect_to reservation_path(@reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
    redirect_to offers_path, status: :see_other
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :total_price)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
