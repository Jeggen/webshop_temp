class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :find_profile, :if => :user_signed_in?

  protected
  def after_sign_in_path_for(resource)
    producten_path
  end

  def after_sign_up_path_for(resource)
    producten_path
    flash[:success] = "Je bent nu ingelogd"
  end

  def current_profile
    @profile = Profile.find_by(user_id: current_user.id)
  end
end
