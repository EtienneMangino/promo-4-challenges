class Display
  def initialize
  end

  def print_list(cookbook)
    cookbook.recipes_list.each do |recipe|
      puts "#{recipe.id}. #{recipe.tested ? "[X]" : "[ ]"} #{recipe.name} - note : #{recipe.rating}/5 - preparation : #{recipe.time}  "
    end
  end

  def print_recipe(index, cookbook)
    recipe_index = ""
    cookbook.recipes_list.each_with_index do |recipe, i|
      recipe_index = i if (recipe.id == index)
    end
    if recipe_index != ""
      recipe = cookbook.recipes_list[recipe_index.to_i]
      puts "#{recipe.id}. #{recipe.tested ? "[X]" : "[ ]"} #{recipe.name} - note : #{recipe.rating}/5 - preparation : #{recipe.time}  \n #{recipe.description}"
    else
      nil
    end
  end

  def ask_new_description_recipe
    puts "Décrivez votre recette ? "
    gets.chomp
  end

  def ask_new_name_recipe
    puts "Quel est le nom de votre recette ? "
    gets.chomp
  end

  def ask_rating
    puts "Quel est la note de votre recette ? (sur 5) "
    begin
      Integer(gets.chomp)
    rescue ArgumentError
      puts "Ce n'est pas une note"
      nil
    end
  end

  def ask_time
    puts "Quel est le temps de préparation de votre recette ? indiquez l'unité "
    gets.chomp
  end

  def ask_recipe_index_to_delete
    puts "Quel est le numéro de la recette que vous voulez supprimer ? "
    begin
      Integer(gets.chomp)
    rescue ArgumentError
      puts "Ce n'est pas un id correct / pas de recette supprimée"
      nil
    end
  end

  def ask_tested_recipe
    puts "Quel est le numéro de la recette que vous voulez marquer comme testée ? "
    begin
      Integer(gets.chomp)
    rescue ArgumentError
      puts "Ce n'est pas un id correct / pas de recette modifiée"
      nil
    end
  end

  def ask_recipe_to_see
    puts "Quel est le numéro de la recette que vous voulez consulter ? "
    begin
      Integer(gets.chomp)
    rescue ArgumentError
      puts "Ce n'est pas un id correct / pas de recette consultée"
      nil
    end
  end

  def ask_research
    puts "Quel est la recette que vous voulez importer ? "
    gets.chomp
  end

  def ask_what_recipe(array_recipes)
    array_recipes.each_with_index do |recipe, i|
      puts "#{i+1} : #{recipe[:name]} "
    end
    puts "Quel est le numéro de la recette que vous voulez importer ? "
    begin
      choice = Integer(gets.chomp) - 1
    rescue ArgumentError
      puts "Ce n'est pas un id correct / pas de recette importée"
      return nil
    end
    choice
  end
end