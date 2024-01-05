# frozen_string_literal: true

class Passwords::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end
  def destroy
    ActiveRecord::Base.transaction do
      # Elimina record correlati nelle tabelle delle recensioni e prenotazioni
      current_user.recensiones.destroy_all
      current_user.prenotaziones.destroy_all
      current_user.ristorantes.destroy_all
      current_user.likes.destroy_all
      current_user.like_recensiones.destroy_all
  
      # Continua con l'eliminazione dell'utente
      resource.destroy
  
      Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
      set_flash_message! :notice, :destroyed
      yield resource if block_given?
      respond_with_navigational(resource) { redirect_to after_sign_out_path_for(resource_name) }
    end
  end


  # POST /resource
  def create
    required_fields = [:nome, :cognome, :email, :password, :password_confirmation, :citta, :cap, :provincia]
  
    if required_fields.any? { |field| params[:user][field].blank? }
      $messaggio_errore = "Riempire tutti i campi"
      redirect_to new_user_registration_path
    else

      @user = User.find_by_email(params[:user][:email])
      if !@user.nil? 
        $messaggio_errore = "Email già esistente, riprovare"
        redirect_to new_user_registration_path
      elsif params[:user][:password] != params[:user][:password_confirmation] 
        $messaggio_errore = "Errore nella registrazione, riprovare"
        redirect_to new_user_registration_path
      elsif !params[:user][:password].match(/\A(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+])[^ ]{8,}\z/)
        $messaggio_errore = "Password debole, riprovare con un'altra"
        redirect_to new_user_registration_path
      else
        super
      end

    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end
  def update

    password = params[:user][:password]
    password_confirmation = params[:user][:password_confirmation]
    current_password = params[:user][:current_password]
    
    if !password.blank? && password != password_confirmation 
      $messaggio_errore = "Le password non corrispondono, riprovare" 
      redirect_to user_password_path

    elsif !password.blank? && !password.match(/\A(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+])[^ ]{8,}\z/)
      $messaggio_errore = "La nuova password non rispetta i requisiti"
      redirect_to user_password_path

    elsif !current_user.valid_password?(current_password)
      $messaggio_errore = "La password attuale non è corretta, modifiche NON applicate"
      redirect_to user_password_path

    else
      super do |resource|
        if resource.errors.empty? &&  !password.blank?
          # Invia l'email di conferma
          PasswordMailer.password_changed(resource).deliver_now
        end
      end
    end
  end
  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  protected

  def after_update_path_for(resource)
    $messaggio_notizia = "Modifiche correttamente applicate" 
    profilo_index_path(resource)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
