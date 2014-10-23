class ManagersRepository
  attr_reader :managers_list

  def initialize(filepath)
    @filepath = filepath
    @managers_list = []

    csv_options = { col_sep: ',', quote_char: '"' }
    CSV.foreach(@filepath, csv_options) do |manager|
      @managers_list << Manager.new(manager[0], manager[1])
    end
  end

  def create_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@filepath, 'w', csv_options) do |csv|
      @managers_list.each do |manager|
        csv << [manager.name, manager.password]
      end
    end
  end

  def add_manager(manager)
    @managers_list << manager
    create_csv
  end

end