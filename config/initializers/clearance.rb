Clearance.configure do |config|
  config.mailer_sender = "reply@example.com"
  config.rotate_csrf_on_sign_in = true
  config.routes = false
  config.redirect_url = "/home"

  Clearance::PasswordsController.layout "no_nav"
  Clearance::SessionsController.layout "no_nav"
  Clearance::UsersController.layout "no_nav"
end
