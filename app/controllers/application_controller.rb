class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

   before_action :configure_permitted_parameters, if: :devise_controller?

 private

 	def after_sign_in_path_for(resource_or_scope)
      events_path
    end

    def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
    end

 protected

 def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
 end
end
  