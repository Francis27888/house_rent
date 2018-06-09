# frozen_string_literal: true
# Registrations Controller

class RegistrationsController < Devise::RegistrationsController
  protected
  
  def index; end

  def after_sign_up_path_for(*)
    new_user_session_path
  end
end