class PurchaseConfirmation
  def self.create(order)
    items = order.order_items.reduce([]) do |items, item|
      items << { "title" =>  item.title,
                 "quantity" => item.quantity }
    end
    order_data = {
      "name" => order.user.full_name,
      "email" => order.user.email,
      "items" => items,
      "total" => order.total
    }
    message = {"type" => "purchase_confirmation", "data" => order_data}
    $redis.publish("email_notifications", message.to_json)
  end
end
