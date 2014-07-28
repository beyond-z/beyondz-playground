Recaptcha.configure do |config|
  config.private_key = Rails.application.secrets.recaptcha_private_key
  config.public_key  = Rails.application.secrets.recaptcha_public_key
  config.use_ssl_by_default = true
end