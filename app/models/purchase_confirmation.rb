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
    Mailer.order_confirmation(order_data).deliver
  end
end
