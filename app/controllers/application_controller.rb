class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def authenticate
    redirect_to root_path unless user_signed_in?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :country, :job, :term, :introduction, :image])
  end

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

end
