require_relative 'cookbook'
require_relative 'controller'
require_relative 'router'
require_relative 'recipe'
require_relative 'display'
require 'nokogiri'
require "open-uri"

class Controller
  attr_reader :cookbook

  def initialize(cookbook)
    @cookbook = cookbook
    @display = Display.new
  end

  def list
    @display.print_list(@cookbook)
  end

  def create
    name = @display.ask_new_name_recipe
    description = @display.ask_new_description_recipe
    rating = @display.ask_rating
    time = @display.ask_time
    id = @cookbook.id_dispo
    recipe = Recipe.new(name, description, id, rating, time)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    @display.print_list(@cookbook)
    index = @display.ask_recipe_index_to_delete
    @cookbook.recipes_list.each_with_index do |recipe, i|
      @cookbook.remove_recipe(i) if (recipe.id == index)
    end
  end

  def import
    search_key = @display.ask_research
    array_recipes = []
    doc = Nokogiri::HTML(open('http://www.marmiton.org/recettes/recherche.aspx?aqt=' + search_key), nil, 'utf-8')

    doc.search('.m_contenu_resultat').each do |element|
      array_recipes << {
      name: element.search('.m_titre_resultat> a').inner_text,
      rating: element.search('.m_recette_note1').size,
      time: element.search('.m_detail_time').inner_text,
      description: element.search('.m_texte_resultat').inner_text
      }
    end
    choosen_recipe = @display.ask_what_recipe(array_recipes)
    if choosen_recipe.nil?
      return
    else
      id = @cookbook.id_dispo
      array_recipes[choosen_recipe][:time] != "" ? (array_recipes[choosen_recipe][:time] = array_recipes[choosen_recipe][:time].match(/(\d+ \w+)/)[1]) : nil
      recipe = Recipe.new(array_recipes[choosen_recipe][:name], array_recipes[choosen_recipe][:description], id, array_recipes[choosen_recipe][:rating], array_recipes[choosen_recipe][:time])
      @cookbook.add_recipe(recipe)
    end


  end

  def mark
    @display.print_list(@cookbook)
    tested_id = @display.ask_tested_recipe
    recipe_index = ""
    cookbook.recipes_list.each_with_index do |recipe, i|
      recipe_index = i if (recipe.id == tested_id)
    end
    if recipe_index != ""
      @cookbook.recipes_list[recipe_index].mark_tested
    else
      nil
    end
  end

  def see
    @display.print_list(@cookbook)
    see_id = @display.ask_recipe_to_see
    @display.print_recipe(see_id, @cookbook) if see_id
  end

end
