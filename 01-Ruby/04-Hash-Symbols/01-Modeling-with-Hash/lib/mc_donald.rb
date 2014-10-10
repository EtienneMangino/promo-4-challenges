
def poor_calories_counter(burger, side, beverage)
  #TODO: return number of calories for this mcDonald order
calories = {"Cheese Burger" => 290,
"Big Mac" => 300,
"Mc Bacon" => 400,
"Royal Cheese" => 130,
"French fries" => 130,
"Potatoes" => 130,
"Coca" => 160,
"Sprite" => 170}

compte = calories[burger] + calories[side] + calories[beverage]

end


def calories_counter(*orders)
  #TODO: return number of calories for a less constrained order
calories = {"Cheese Burger" => 290,
"Big Mac" => 300,
"Mc Bacon" => 400,
"Royal Cheese" => 130,
"French fries" => 130,
"Potatoes" => 130,
"Coca" => 160,
"Sprite" => 170}

meal = {
  "Happy Meal" => ["Cheese Burger", "French fries", "Coca"],
  "Best Of Big Mac" => ["Big Mac", "French fries", "Coca"],
  "Best Of Royal Cheese" => ["Royal Cheese", "Potatoes", "Sprite"]
}
sum = 0

orders.each do |x|
  if  x == "Happy Meal" ||x == "Best Of Big Mac" || x =="Best Of Royal Cheese"
    sum += poor_calories_counter(meal[x][0], meal[x][1], meal[x][2])
  else
    sum += calories[x]
  end
end
sum

end

p calories_counter("Happy Meal", "Best Of Royal Cheese")