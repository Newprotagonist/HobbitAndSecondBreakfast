class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @review.reservation = Reservation.find(params[:reservation_id])
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @reservation = Reservation.find(params[:reservation_id])
    @review.reservation = @reservation
    @review.giver = current_user
    @review.receiver = current_user.hobbit ? @review.reservation.user : @review.reservation.offer.user
    authorize @review
    respond_to do |format|
      if !current_user.reviewed?(@review.reservation) and @review.save!
        format.html { redirect_to reservation_path(@review.reservation) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
