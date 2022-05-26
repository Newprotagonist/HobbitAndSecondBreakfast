class ProfilesController < ApplicationController
  before_action :set_user

  def profile
    skip_authorization
  end

  private

  def set_user
    @user = current_user
  end
end
