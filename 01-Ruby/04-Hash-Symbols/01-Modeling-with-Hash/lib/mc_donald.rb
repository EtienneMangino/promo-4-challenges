CALORIES = {"Cheese Burger" => 290,
"Big Mac" => 300,
"Mc Bacon" => 400,
"Royal Cheese" => 130,
"French fries" => 130,
"Potatoes" => 130,
"Coca" => 160,
"Sprite" => 170}

MEAL = {
  "Happy Meal" => ["Cheese Burger", "French fries", "Coca"],
  "Best Of Big Mac" => ["Big Mac", "French fries", "Coca"],
  "Best Of Royal Cheese" => ["Royal Cheese", "Potatoes", "Sprite"]
}

def poor_calories_counter(burger, side, beverage)
  #TODO: return number of CALORIES for this mcDonald order

compte = CALORIES[burger] + CALORIES[side] + CALORIES[beverage]

end


def calories_counter(*orders)
  #TODO: return number of CALORIES for a less constrained order

sum = 0

orders.each do |x|
  if  MEAL.include?(x)
    sum += poor_calories_counter(MEAL[x][0], MEAL[x][1], MEAL[x][2])
  else
    sum += CALORIES[x]
  end
end
sum

end

p calories_counter("Happy Meal", "Best Of Royal Cheese")