class OffersController < ApplicationController
  def index
    @users = User.all
    @offers = Offer.all
  end
end
