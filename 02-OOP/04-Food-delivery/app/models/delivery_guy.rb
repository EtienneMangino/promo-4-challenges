class DeliveryGuy < Employee
  attr_reader :order

  def receive_an_order(order)
    @order = order
  end

end



