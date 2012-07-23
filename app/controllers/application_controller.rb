class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  helper_method :user_signed_in?

  private
  def require_login!
    unless user_signed_in?
      redirect_to "/auth/cas", alert: "Bitte zuerst anmelden!"
    end
  end
end
