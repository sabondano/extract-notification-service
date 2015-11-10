require 'redis'
require 'mailer'
redis = Redis.new
redis.subscribe("email_notifications") do |event|
  event.message do |channel, body|
    body = JSON.parse(body)
    if body["type"] == "purchase_confirmation" 
      Mailer.order_confirmation(body["data"]).deliver 
    end

    if body["type"] == "signup_confirmation"
      Mailer.welcome_email(body["data"]).deliver
    end
  end
end
