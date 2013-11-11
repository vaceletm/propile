class AccountMailer < ActionMailer::Base
  default from: "contact@conference-agile.fr"

  def confirmation( account )
    @account = account
    mail to: account.email
  end
end
