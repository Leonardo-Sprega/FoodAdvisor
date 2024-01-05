# frozen_string_literal: true

class Passwords::PasswordsController < Devise::PasswordsController

  skip_before_action :require_no_authentication, only: [:new]
  # GET /resource/password/new
  # def new
  #   super
  # end
  
  def new
    # Esegui il logout se l'utente è attualmente loggato
    sign_out(current_user) if user_signed_in?
    super
  end

  # POST /resource/password
  def create
    @user = User.find_by_email(params[:user][:email])
    if @user.nil? 
      $messaggio_errore = "Errore nell'invio dell'email, riprovare"
      redirect_to new_user_password_path
    else
      super do |resource|
        if resource.errors.empty?
          $messaggio_notizia = "Email inviata correttamente, apri il link nell'email per reimpostare la tua password"
        else
          $messaggio_errore = "Errore nell'invio dell'email, riprovare"
        end
      end
    end
   
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  def update
    password = params[:user][:password]
    password_confirmation = params[:user][:password_confirmation]
  
    if password.blank? || password_confirmation.blank?
      $messaggio_errore = "Riempire tutti i campi"
      redirect_to user_password_path
    elsif password != password_confirmation 
      $messaggio_errore = "Le password non corrispondono, riprovare" 
      redirect_to user_password_path
    elsif !password.match(/\A(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+])[^ ]{8,}\z/)
      $messaggio_errore = "Password debole, riprovare con un'altra"
      redirect_to user_password_path
    else
      super do |resource|
        if resource.errors.empty?
          # Invia l'email di conferma
          PasswordMailer.password_changed(resource).deliver_now
        end
      end
    end
  end



  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
