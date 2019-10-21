
class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

end
