class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[profile]

  def profile
    skip_authorization
    @user = current_user
  end
end
