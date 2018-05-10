class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    home_another_path
  end
end