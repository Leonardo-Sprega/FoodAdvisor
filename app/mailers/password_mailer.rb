class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
  def conf_prenotazione(email, rist, ora, data, na, nb)
    @email=email
    @rist = rist
    @ora = ora
    @data = data
    @na = na
    @nb = nb
    mail(to: @email, subject: "Conferma prenotazione a #{@rist.nome}") do |format|
      format.html{render template:'devise/mailer/confirmation_prenotazione', layout:'mailer'}
    end
  end
  
end
