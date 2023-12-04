class OmniauthController < ApplicationController

    def github
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user
        else
            redirect_to new_user_session_path , flash: {notice: "Errore nell\'accesso con GitHub, riprovare"}
        end
    end



    def google_oauth2
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user
        else
            redirect_to new_user_session_path , flash: {notice: "Errore nell\'accesso con Google, riprovare"}
        end
    end



    def failure
        redirect_to new_user_registration_url , flash: {notice: "Errore nella registrazione, riprovare"}
    end
        

end
