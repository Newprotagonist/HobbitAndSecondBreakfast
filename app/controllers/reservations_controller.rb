class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy accept decline]
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
      redirect_to reservations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @offer = @reservation.offer
    authorize @reservation
  end

  def update
    @offer = @reservation.offer
    @reservation.total_price = (@reservation.end_date - @reservation.start_date) * @offer.price
    @reservation.status = "Pending"
    authorize @reservation
    if @reservation.update(reservation_params)
      redirect_to reservations_path(@reservation)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @reservation
    @reservation.destroy
    redirect_to reservations_path, status: :see_other
  end

  def accept
    authorize @reservation
    @reservation.status = "Accepted"
    authorize @reservation
    @reservation.save
    redirect_to reservations_path
  end

  def decline
    @reservation.status = "Declined"
    authorize @reservation
    @reservation.save
    redirect_to reservations_path
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
