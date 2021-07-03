class ApplicationMailer < ActionMailer::Base
  default from: %{"Test Guru" <arummail@example.com>}
  layout 'mailer'
end
