class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def password_changed(user)
    @user = user
    mail(to: @user.email, subject: 'Conferma modifica password') do |format|
      format.html { render template: 'devise/mailer/password_change', layout: 'mailer' }
    end
  end

  def reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
