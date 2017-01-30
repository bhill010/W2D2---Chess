class Employee
  attr_reader :name, :title
  attr_accessor :salary, :manager, :boss

  def initialize(name, title, salary, manager = false, boss = nil)
    @name, @title, @salary, @manager, @boss = name, title, salary, manager, boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

  def boss=(boss)
    @boss = boss
  end
end
