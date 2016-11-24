class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_filter :store_current_location, :unless => :devise_controller?


  def store_current_location
    store_location_for(:user, request.url)
  end

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

  def after_sign_out_path_for(resource)
    request.referrer || root_path
  end

end

