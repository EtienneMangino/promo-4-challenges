class OrdersRepository

  attr_reader :orders_list

  def initialize()
    @orders_list = []
  end

  def add_order(order)
    @orders_list << order
  end

  def remove_order(order_id)
    @orders_list.delete_at(order_id)
  end
end