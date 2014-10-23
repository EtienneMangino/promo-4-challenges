# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#    $ ruby app.rb
require 'require_all'
require 'csv'
require_relative 'router'

require_all 'app'

def lancer_app
  restaurant = Restaurant.new("le Wagon Restaurant")

  managers_repo = ManagersRepository.new("app/repositories/managers.csv")

  delivery_guys_repo = DeliveryGuysRepository.new("app/repositories/delivery_guys.csv")

  meals_repo = MealsRepository.new("app/repositories/meals.csv")

  customers_repo = CustomersRepository.new("app/repositories/customers.csv")

  #order1 = Order.new(custo1,delivery_guy,meal1)
  orders_repo = OrdersRepository.new
  #orders_repo.add_order(order1)

  #-----

  customers_control = CustomersController.new(customers_repo)
  employees_control = EmployeesController.new(managers_repo, delivery_guys_repo)
  orders_control = OrdersController.new(orders_repo, meals_repo, customers_repo, delivery_guys_repo)

  router = Router.new(customers_control, employees_control, orders_control, restaurant)

# Start the app
  router.run
end

lancer_app
