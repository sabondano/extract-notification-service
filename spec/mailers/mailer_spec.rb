require 'spec_helper'

describe Mailer do

  before(:each) do
    ActionMailer::Base.delivery_method = :smtp
  end

  it 'sends a welcome email' do
    user = FactoryGirl.create(:user)
    email = Mailer.welcome_email({"name" => user.full_name, "email" => user.email}).deliver
  end

  it 'sends an order confirmation email' do
    data = {
      "name" => "Alice Smith",
      "email" => "alice@example.com",
      "items" => [
        {
          "title" => "Li Hing Mui Lollypops",
          "quantity" => 3
        }
      ],
      "total" => 12.00
    }
    email = Mailer.order_confirmation(data).deliver
  end
end
