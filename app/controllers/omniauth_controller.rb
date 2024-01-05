class OmniauthController < ApplicationController

    def github
        email = request.env['omniauth.auth'].info.email
        @user = User.find_by(email: email)

        if @user.nil?
            # Caso 3: Nessun utente con quell'email, crea un nuovo utente
            @user = User.create_from_provider_data(request.env['omniauth.auth'])
            if @user.persisted?
            sign_in_and_redirect @user
            else
            redirect_to new_user_session_path, flash: { alert: 'Errore nell\'accesso con GitHub, riprovare' }
            end
        else
            if @user.provider.nil?
            # Caso 2: Utente con quell'email, ma non ha già fatto il login con GitHub
            redirect_to new_user_session_path, flash: { alert: 'Email già esistente' }
            elsif @user.provider == 'github'
            # Caso 1: Utente con quell'email che ha già fatto il login con GitHub
            sign_in_and_redirect @user
            else
            # Caso in cui l'utente ha già fatto il login con un altro provider (escludendo GitHub)
            redirect_to new_user_session_path, flash: { alert: 'Email già esistente con un altro provider' }
            end
        end
        
        rescue StandardError => e
        # Caso 4: Gestione di altri errori
        redirect_to new_user_session_path, flash: { alert: 'Errore' }
    end


    def google_oauth2
        email = request.env['omniauth.auth'].info.email
        @user = User.find_by(email: email)

        if @user.nil?
            # Caso 3: Nessun utente con quell'email, crea un nuovo utente
            @user = User.create_from_provider_data(request.env['omniauth.auth'])
            if @user.persisted?
            sign_in_and_redirect @user
            else
            redirect_to new_user_session_path, flash: { alert: 'Errore nell\'accesso con Google, riprovare' }
            end
        else
            if @user.provider.nil?
            # Caso 2: Utente con quell'email, ma non ha già fatto il login con google_oauth2
            redirect_to new_user_session_path, flash: { alert: 'Email già esistente' }
            elsif @user.provider == 'google_oauth2'
            # Caso 1: Utente con quell'email che ha già fatto il login con google_oauth2
            sign_in_and_redirect @user
            else
            # Caso in cui l'utente ha già fatto il login con un altro provider (escludendo google_oauth2)
            redirect_to new_user_session_path, flash: { alert: 'Email già esistente con un altro provider' }
            end
        end
        
        rescue StandardError => e
        # Caso 4: Gestione di altri errori
        redirect_to new_user_session_path, flash: { alert: 'Errore' }
    end




    def failure
        redirect_to new_user_registration_url , flash: {alert: "Errore, riprovare"}
    end
        

end
