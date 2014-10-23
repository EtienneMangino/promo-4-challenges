class EmployeesController


  def initialize(managers_repo, delivery_guys_repo)
    @managers_repo = managers_repo
    @delivery_guys_repo = delivery_guys_repo
    @view_employee = EmployeesView.new
    @employees_list = managers_repo.managers_list + delivery_guys_repo.delivery_guys_list
  end

  def list_employees
    @view_employee.view_employees_list(@employees_list)

  end

  def identification
    login = @view_employee.ask_for_login
    password = @view_employee.ask_for_password

    @employees_list.each do |employee|
      if employee.name == login && employee.password == password
        return employee
      end
    end
    puts "Mauvais identifiant ou mot de passe"
  end

end