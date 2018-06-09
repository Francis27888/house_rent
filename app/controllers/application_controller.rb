# frozen_string_literal: true
# ApplicationController

class ApplicationController < ActionController::Base
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  
  protected

  def configure_devise_permitted_parameters
    permitted_params = %i[email password password_confirmation names phone_number user_category]
    if params[:action] == 'update'
      devise_parameter_sanitizer.permit(:account_update, keys: [permitted_params, :current_password])
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.permit(:sign_up, keys: [permitted_params])
    end
  end

  def after_sign_in_path_for(*)
    @user = User.find_by(email: current_user.email)
    if @user.user_category == 'Renter'
      if params[:id].present?
        house_booking_path(params[:id])
      else
        root_path
      end
    else
      houses_path
    end
  end
end
