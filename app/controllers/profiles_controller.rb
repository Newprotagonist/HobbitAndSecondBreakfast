class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[profile]
  before_action :set_user
  def profile
    skip_authorization

  end

  private

  def users_params
    params.require(:user).permit(:photo)
  end

  def set_user
    @user = current_user
  end
end
