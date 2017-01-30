require_relative "Employee"

class Manager < Employee
  attr_accessor :subordinates

  def initialize(name, title, salary, subordinates = [], manager = true, boss = nil)
    @subordinates = subordinates
    super(name, title, salary, manager,boss)
  end

  def bonus(multiplier)
    salary_total = 0
    queue = @subordinates
    until queue.empty?
      current_employee = queue.shift
      if current_employee.manager
        queue += current_employee.subordinates
      end
      salary_total += current_employee.salary
    end
    salary_total * multiplier
  end

  def subordinate=(subordinate)
    @subordinates += subordinate
    subordinate.boss = self.name
  end

end
