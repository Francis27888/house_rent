class RegistrationsController < Devise::RegistrationsController
  protected
  
  def index
    
  end

  def after_sign_up_path_for(resource)
     new_user_session_path
  end
end