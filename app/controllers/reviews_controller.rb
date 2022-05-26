class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @review.reservation = Reservation.find(params[:reservation_id])
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.reservation = Reservation.find(params[:reservation_id])
    @review.giver = current_user
    @review.receiver = current_user.hobbit ? @review.reservation.user : @review.reservation.offer.user
    authorize @review
    if !current_user.reviewed?(@review.reservation) and @review.save!
      @review.reservation.status = "Done"
      redirect_to reservation_path(@review.reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
