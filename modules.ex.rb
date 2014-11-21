module MyCustomModule
  class Employee

    @@num = 0 

    def initialize(name, salary)
      @name = name
      @salary = salary
      @@num += 1
    end

    def self.total_employees
      if @@num < 2
        "In total there is #{@@num} employee."
      else
        "There are #{@@num} employees in total."
      end
    end

    def to_s
      "#{@name} earns #{@salary} per annum."
    end
  end

  module Managable
    def can_manage?
      true
    end
    def to_s
      puts "This is a manager"
      super
    end
  end

  module Benefits
    def vacation_days
      20
    end
  end

  module SpecialBenefit
    def company_car
      "Tesla Model T"
    end
  end

  class Manager < Employee
    include Managable 
  end

  class Staff < Employee
    extend Benefits
  end

  class Director < Employee
    include Managable
    def to_s
      puts "i'm in the Director class"
      super
    end
  end
end

jason = MyCustomModule::Director.new('Jason', 50000)
lyle = MyCustomModule::Director.new('Lyle', 50000)
claire = MyCustomModule::Staff.new('Claire', 20000)
laura = MyCustomModule::Staff.new('Laura', 20000)

puts jason.can_manage?
puts jason
puts lyle
puts claire
puts laura
puts MyCustomModule::Employee.total_employees
puts MyCustomModule::Staff.vacation_days
jason.extend(MyCustomModule::SpecialBenefit)
puts jason. company_car
