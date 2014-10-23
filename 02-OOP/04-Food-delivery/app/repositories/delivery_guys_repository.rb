class DeliveryGuysRepository
  attr_reader :delivery_guys_list

  def initialize(filepath)
    @filepath = filepath
    @delivery_guys_list = []

    csv_options = { col_sep: ',', quote_char: '"' }
    CSV.foreach(@filepath, csv_options) do |delivery_guy|
      @delivery_guys_list << DeliveryGuy.new(delivery_guy[0], delivery_guy[1])
    end
  end

  def create_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@filepath, 'w', csv_options) do |csv|
      @delivery_guys_list.each do |delivery_guy|
        csv << [delivery_guy.name, delivery_guy.password]
      end
    end
  end

  def add_delivery_guy(delivery_guy)
    @delivery_guys_list << delivery_guy
    create_csv
  end

end