require 'require_all'

require_all 'app'

class Router
  def initialize(customers_control, employees_control, orders_control, restaurant)
    @customers_control = customers_control
    @employees_control = employees_control
    @orders_control = orders_control
    @restaurant = restaurant
    @running = true
  end

  def run
    puts "Welcome to  #{@restaurant.name}!"
    puts "           --           "
    puts "Se connecter avec un compte ou quitter ? (\"no\" pour quitter)"
    answer = gets.chomp

    while answer.downcase != "no"
      @running = true
      identification = @employees_control.identification

      while identification.nil?
        identification = @employees_control.identification
      end

      if identification.class == Manager
        puts "++++++++++++++++++++++++++++"
        puts "HELLO #{identification.name}"
        running_manager
      else
        puts "++++++++++++++++++++++++++++"
        puts "HELLO #{identification.name}"
        running_delivery_guy
      end

      puts "Se connecter avec un compte ou quitter ? (\"no\" pour quitter)"
      answer = gets.chomp
    end
  end


  def running_manager
    while @running
      display_tasks_manager
      action = gets.chomp.to_i
      print `clear`
      route_action_manager(action)
    end
  end

   def running_delivery_guy
    while @running
      display_tasks_delivery_guy
      action = gets.chomp.to_i
      print `clear`
      route_action_delivery_guy(action)
    end
  end

  def stop
    @running = false
  end

  private

  def route_action_manager(action)
    case action
    when 1 then @customers_control.list_customers
    when 2 then @customers_control.add_customer_to_list
    when 3 then @orders_control.list_orders
    when 4 then @orders_control.add_order_to_list
    when 5 then @orders_control.remove_order_to_list
    when 6 then @employees_control.list_employees
    when 7 then stop
    else puts "Please press 1, 2, 3, 4, 5, 6 or 7"
    end
  end

  def display_tasks_manager
    puts ""
    puts "What do you want to do next?"
    puts "1. List customers"
    puts "2. Add customer"
    puts "3. View orders"
    puts "4. Add order  "
    puts "5. Remove order "
    puts "6. List employees"
    puts "7. Log out"
  end

  def route_action_delivery_guy(action)
    case action
    when 1 then @orders_control.list_orders
    when 2 then @orders_control.complete_order
    when 3 then stop
    else puts "Please press 1, 2 or 3"
    end
  end

  def display_tasks_delivery_guy
    puts ""
    puts "What do you want to do next?"
    puts "1. View orders"
    puts "2. Complete order "
    puts "3. Log out"
  end
end
