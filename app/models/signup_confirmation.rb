class SignupConfirmation
  def self.create(user)
    signup_data = {"name" => user.full_name, "email" => user.email}
    message = {"type" => "signup_confirmation", "data" => signup_data}
    $redis.publish("email_notifications", message.to_json)
  end
end
