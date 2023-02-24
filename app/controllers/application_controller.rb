class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    private
    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to home_index_path, notice: "Please Login to view that page!" if request.original_fullpath != home_index_path
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:name, :email, :password, :password_confirmation, :role)
      end
  
      devise_parameter_sanitizer.permit(:sign_in) do |user_params|
        user_params.permit(:email, :password, :remember_me)
      end
    end
end
