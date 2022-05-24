class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]
  before_action :set_offer, only: %i[new create]

  def index
    @reservations = policy_scope(Reservation)
  end

  def show
    authorize @reservation
  end

  def new
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.offer = @offer
    @reservation.user = current_user
    @reservation.total_price = (@reservation.end_date - @reservation.start_date) * @offer.price
    authorize @reservation
    if @reservation.save!
      redirect_to reservation_path(@reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @offer = @reservation.offer
    authorize @reservation
  end

  def update
    @reservation.total_price = (@reservation.end_date - @reservation.start_date) * @offer.price
    authorize @reservation
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @reservation
    @reservation.destroy
    redirect_to reservations_path, status: :see_other
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_offer
    @offer = Offer.find(params[:offer_id])
  end
end
