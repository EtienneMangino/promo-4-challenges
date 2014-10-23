class CustomersController

  def initialize(customers_repo)
    @customers_repo = customers_repo
    @view_customer = CustomersView.new
  end


  def list_customers
    @view_customer.view_customers_list(@customers_repo.customers_list)
  end

  def add_customer_to_list
    name = @view_customer.get_name_for_customer
    address = @view_customer.get_address_for_customer
    new_customer = Customer.new(name,address)
    @customers_repo.add_customer(new_customer)
  end

end