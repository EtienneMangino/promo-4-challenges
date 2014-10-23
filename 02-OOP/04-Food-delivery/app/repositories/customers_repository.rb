
class CustomersRepository
  attr_reader :customers_list

  def initialize(filepath)
    @filepath = filepath
    @customers_list = []

    csv_options = { col_sep: ',', quote_char: '"' }
    CSV.foreach(@filepath, csv_options) do |customer|
      @customers_list << Customer.new(customer[0], customer[1])
    end
  end

  def create_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@filepath, 'w', csv_options) do |csv|
      @customers_list.each do |customer|
        csv << [customer.name, customer.address]
      end
    end
  end

  def add_customer(customer)
    @customers_list << customer
    create_csv
  end

end