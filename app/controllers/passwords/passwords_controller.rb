# frozen_string_literal: true

class Passwords::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

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

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
