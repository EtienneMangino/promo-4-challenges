class Display
  def initialize
  end

  def print_list(cookbook)
    cookbook.recipes_list.each_with_index do |recipe, index|
      puts "#{index + 1} : #{recipe.name} \n #{recipe.description}" # if (recipe.name != "" || recipe.description != "")
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

  def ask_recipe_index_to_delete
    puts "Quel est le numéro de la recette que vous voulez supprimer ? "
    begin
      id = Integer(gets.chomp)
      id - 1
    rescue ArgumentError
      puts "Ce n'est pas un id correct / pas de recette supprimée"
      nil
    end
  end
end