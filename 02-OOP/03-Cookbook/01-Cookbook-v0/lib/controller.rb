require_relative 'cookbook'
require_relative 'controller'
require_relative 'router'
require_relative 'recipe'
require_relative 'display'

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
    recipe = Recipe.new(name, description)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    @display.print_list(@cookbook)
    index = @display.ask_recipe_index_to_delete
    @cookbook.remove_recipe(index) if index
  end
end
