class Order
  attr_reader :customer, :delivery_guy, :id, :meal, :completed, :date

  def initialize(customer, delivery_guy, meal)
    @customer = customer
    @delivery_guy = delivery_guy
    @meal = meal
    @date = Time.now
  end

  def order_completed

  end

end
