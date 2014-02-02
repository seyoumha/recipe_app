class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!

  protect_from_forgery with: :null_session

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
  end
	
  def after_sign_up_path_for(resource)
  	'/recipes/new'
  end
  def after_inactive_sign_up_path_for(resource)
  	'/recipes/new'
  end
  def after_sign_out_path_for(resource)
  	'/users/sign_in'
  end
end
