class OrdersView

  def initialize
  end

  def view_orders_list(orders_list)
    orders_list.each_with_index do |order, index|
      puts "#{index+1} => meal: #{order.meal.name} || customer: #{order.customer.name} || address: #{order.customer.address} || delivery guy: #{order.delivery_guy.name}"
    end
  end

  def ask_customer_id(customers_list)
    customers_list.each_with_index do |customer, index|
      puts "#{index+1}. name: #{customer.name} address: #{customer.address} "
    end
    puts "Quel est le numéro du client que vous souhaitez? "
    begin
      answer = Integer(gets.chomp)-1
    rescue ArgumentError
      puts "Ce n'est pas un id correct "
      nil
    end
    (0..(customers_list.size-1)).to_a.include?(answer) ? answer : (puts "Ce n'est pas un id correct ")
  end

  def ask_delivery_guy_id(delivery_guys_list)
    puts "++++++++++++++++++++++++++++++++++"
    delivery_guys_list.each_with_index do |delivery, index|
      puts "#{index+1}. name: #{delivery.name} "
    end
    puts "Quel est le numéro du livreur que vous souhaitez ? "
    begin
      answer = Integer(gets.chomp)-1
    rescue ArgumentError
      puts "Ce n'est pas un id correct "
      nil
    end
    (0..(delivery_guys_list.size-1)).to_a.include?(answer) ? answer : (puts "Ce n'est pas un id correct ")
  end

  def ask_meal_id(meals_list)
    puts "++++++++++++++++++++++++++++++++++"
    meals_list.each_with_index do |meal, index|
      puts "#{index+1}. name: #{meal.name}  price: #{meal.price} €"
    end
    puts "Quel est le numéro de menu que vous souhaitez ? "
    begin
      answer = Integer(gets.chomp)-1
    rescue ArgumentError
      puts "Ce n'est pas un id correct "
      nil
    end
    (0..(meals_list.size-1)).to_a.include?(answer) ? answer : (puts "Ce n'est pas un id correct ")
  end

  def ask_order_id(orders_list)
    view_orders_list(orders_list)
    puts "Quel est le numéro de la commande que vous souhaitez ? "
    begin
      Integer(gets.chomp)-1
    rescue ArgumentError
      puts "Ce n'est pas un id correct "
      nil
    end
  end


end

