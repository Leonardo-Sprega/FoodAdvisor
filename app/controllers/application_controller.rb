class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nome])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:cognome])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:ristoratore])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:citta])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:cap])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:provincia])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])

      devise_parameter_sanitizer.permit(:account_update, keys: [:nome])
      devise_parameter_sanitizer.permit(:account_update, keys: [:cognome])
      devise_parameter_sanitizer.permit(:account_update, keys: [:ristoratore])
      devise_parameter_sanitizer.permit(:account_update, keys: [:citta])
      devise_parameter_sanitizer.permit(:account_update, keys: [:cap])
      devise_parameter_sanitizer.permit(:account_update, keys: [:provincia])
      devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
    end
end
