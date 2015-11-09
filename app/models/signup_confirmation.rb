class SignupConfirmation
  def self.create(user)
    mailer_data = {"name" => user.full_name, "email" => user.email}
    Mailer.welcome_email(mailer_data).deliver
  end
end
