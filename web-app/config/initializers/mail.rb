ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: '587',
  authentication: :plain,
  user_name: 'maheshwpawar',
  password: 'tudip123',
  domain: 'gmail.com',
  enable_starttls_auto: true
}
ActionMailer::Base.delivery_method = :smtp
