class CustomersView

  def initialize
  end

  def view_customers_list(customers)
    customers.each_with_index do |customer, index|
      puts "#{index+1}. name: #{customer.name} || adresse: #{customer.address}"
    end
  end

  def get_name_for_customer
    puts " Quel est le nom de votre client ? "
    gets.chomp
  end

  def get_address_for_customer
    puts " Quel est l'adresse de votre client ? "
    gets.chomp
  end

end