require 'spec_helper'

module MailerMacros
  def mail_to_capybara_fragment(mail)
    html_part = mail.parts.find { |e| e.content_type =~ /html/ }
    raise "Missing expected html part in email" unless html_part
    Capybara.string(html_part.decoded)
  end
end