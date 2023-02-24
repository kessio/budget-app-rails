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
        devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password])
        devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password current_password])
      end
end
