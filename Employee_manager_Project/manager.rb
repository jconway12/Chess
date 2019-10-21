require_relative "employee"

class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss = nil, employees)
    @employees = employees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    bonus = 0
    self.employees.each {|employee| bonus += employee.salary}
    bonus *= multiplier
  end

end

Emp_1 = Employee.new("David", "CEO", 100, "Jesse")
Emp_2 = Manager.new("Jesse", "Owner", 1000, [Emp_1])
p Emp_1.bonus(2)
p Emp_2.bonus(3)