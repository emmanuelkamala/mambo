class RegistrationsController < Devise::RegistrationsController
    before_action :update_sanitized_params, if: :devise_controller?

    def update_sanitized_params
      devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :first_name, :last_name, :password, :password_confirmation)}
      devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :email, :current_password)}
    end


    def after_update_path_for(resource)
        posts_path
    end

end