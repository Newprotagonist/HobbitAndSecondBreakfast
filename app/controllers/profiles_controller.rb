class ProfilesController < ApplicationController
  skip_after_action :verify_authorized

  def profile
    @user = current_user
  end

  def other
    @user = User.find(params[:id])
    render template: "profiles/profile"
  end
end
