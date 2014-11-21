class Student
  
  attr_accessor :name, :grade


  def initialize(n,g,s)
    @name = n
    @grade = g
    @ssn = s
  end

  def better_grade_than?(name)
    puts "Good Job!" if grade > name.grade
  end

  def partial_ssn
    "xxx-xx-" + @ssn.split('-').last
  end

  protected

  def grade
    @grade
  end 

  def ssn
    @ssn
  end
end

jason = Student.new("Jason", 90, "321-21-4321")

puts jason.name

bill = Student.new("Bill", 80, "456-12-9889")

jason.better_grade_than?(bill)
puts jason.partial_ssn
puts bill.partial_ssn
puts jason.inspect
