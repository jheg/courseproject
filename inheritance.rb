class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end
  def say_hi
    p "Hi from Animal"
  end
end

class Mammal < Animal
end

class Dog < Mammal
  attr_reader :breed

  def initialize(name, breed)
    super(name)
    @breed = breed
  end

  def say_hi
    p "Hi from Dog" 
  end



  def to_s 
    "Your dogs name is #{self.name} and it is a #{self.breed}"
  end
end

my_dog = Dog.new("Yappie", "Terrier")
p my_dog
puts my_dog

my_dog.say_hi
my_dog.send :say_hi

puts my_dog.instance_of? Dog
puts my_dog.instance_of? Mammal
puts my_dog.instance_of? Animal