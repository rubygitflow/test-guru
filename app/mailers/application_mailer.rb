class ApplicationMailer < ActionMailer::Base
  default from: %{'TestGuru', <#{ENV['ADMIN_EMAIL']}>}
  layout 'mailer'
end
