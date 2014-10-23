class MealsRepository

  attr_reader :meals_list

  def initialize(filepath)
    @filepath = filepath
    @meals_list = []

    csv_options = { col_sep: ',', quote_char: '"' }
    CSV.foreach(@filepath, csv_options) do |meal|
      @meals_list << Meal.new(meal[0], meal[1])
    end
  end

  def create_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@filepath, 'w', csv_options) do |csv|
      @meals_list.each do |meal|
        csv << [meal.name, meal.price]
      end
    end
  end

  def add_meal(meal)
    @meals_list << meal
    create_csv
  end

end