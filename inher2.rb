class Animal
  attr_accessor :name

  def initialize(n)
    @name = n
  end

  def eat
    "#{name} is eating"
  end
end

class Mammal < Animal
  def warm_blooded?
    "#{name} is warm blooded"
  end 
end

class Dog < Mammal
  def eat
    super + " #{name} is eating lots"
  end
end

class Cat < Mammal

end

teddy = Dog.new('Teddy')
puts teddy.name
puts teddy.eat
puts teddy.warm_blooded?


owen = Cat.new('Owen')
puts owen.name
puts owen.eat