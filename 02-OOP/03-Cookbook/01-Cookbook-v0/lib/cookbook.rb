require 'csv'
require_relative 'recipe'

class Cookbook
  attr_reader :recipes_list

  def initialize(filepath)
    @filepath = filepath
    @recipes_list = []

    csv_options = { col_sep: ',', quote_char: '"' }
    CSV.foreach(@filepath, csv_options) do |recipe|
      @recipes_list << Recipe.new(recipe[0], recipe[1])
    end
  end

  def create_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@filepath, 'w', csv_options) do |csv|
      @recipes_list.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end

  def add_recipe(recipe)
    @recipes_list << recipe
    create_csv
  end

  def remove_recipe(index_recipe)
    @recipes_list.delete_at(index_recipe)
    # @recipes_list[index_recipe].delete_recipe
    create_csv
  end

  def recipes
    @recipes_list if recipes_list
  end
end

