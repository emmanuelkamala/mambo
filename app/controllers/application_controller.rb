class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?


    def after_sign_in_path_for(resource)
        posts_path
    end


  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :password, :password_confirmation, :email])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password_confirmation, :password, :current_password])

    end



end
