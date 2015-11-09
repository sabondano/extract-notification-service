class Mailer < ActionMailer::Base
  default from: "frank@franks-monsterporium.com"

  def welcome_email(user)
    @user = user
    mail(to: user["email"], subject: "Welcome to Frank's Monsterporium!")
  end

  def order_confirmation(order_data)
    @order_data = order_data
    mail(to: @order_data["email"], subject: "Thanks for your purchase!")
  end
end
