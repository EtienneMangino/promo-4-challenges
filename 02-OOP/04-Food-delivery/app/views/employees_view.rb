class EmployeesView

  def initialize
  end

  def view_employees_list(employees_list)
    employees_list.each_with_index do |employee, index|
      puts "#{index+1}. name: #{employee.name} "
    end

  end

  def ask_for_login
    puts "tapez votre login"
    gets.chomp
  end

  def ask_for_password
    puts "tapez votre password"
    gets.chomp
  end
end