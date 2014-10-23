class OrdersController

  def initialize(orders_repo, meals_repo, customers_repo, delivery_guys_repo)
    @orders_repo = orders_repo
    @meals_repo = meals_repo
    @customers_repo = customers_repo
    @delivery_guys_repo = delivery_guys_repo
    @view_order = OrdersView.new
  end

  def list_orders
    @view_order.view_orders_list(@orders_repo.orders_list)
  end

  def add_order_to_list
    customer_id = @view_order.ask_customer_id(@customers_repo.customers_list)
    return if customer_id.nil?
    customer = @customers_repo.customers_list[customer_id]

    delivery_guy_id = @view_order.ask_delivery_guy_id(@delivery_guys_repo.delivery_guys_list)
    return if delivery_guy_id.nil?
    delivery_guy = @delivery_guys_repo.delivery_guys_list[delivery_guy_id]

    meal_id = @view_order.ask_meal_id(@meals_repo.meals_list)
    return if meal_id.nil?
    meal = @meals_repo.meals_list[meal_id]

    order = Order.new(customer, delivery_guy, meal)
    @orders_repo.add_order(order)
  end

  def remove_order_to_list
    order_id = @view_order.ask_order_id(@orders_repo.orders_list)
    return if order_id.nil?
    @orders_repo.remove_order(order_id)
  end

  def complete_order
    remove_order_to_list
  end
end