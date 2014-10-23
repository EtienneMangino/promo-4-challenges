class RestaurantsController

  def initialize(restaurant_repo)
    @restaurant_repo = restaurant_repo
  end

  def add_a_restaurant
    name = ask_restaurant_name
    restaurant = Restaurant.new(name)
    @restaurant_repo.set_restaurant_name(restaurant)
  end

end
