class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include VotesHelper
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:logo, :name, :password, :password_confirmation, :email)}
  end
  def index
  end
end
