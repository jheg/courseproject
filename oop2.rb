class Animal   
  attr_accessor :name

  def initialize(n)
    @name = n
  end

  def eat
    "#{name} is eating"
  end

  def speaking
    "#{name} is speaking"
  end
end

module Swimmable
  def can_swim?
    true
  end
end

class Mammal < Animal
  def warm_blooded?
    true
  end
end

class Dog < Mammal
  def fetching
    "#{name} is fetching"
  end
  def speaking
    "#{name} is barking!"
  end
  include Swimmable
end

class Cat < Mammal
  def speaking
    "#{name} is meowing!"
  end


end

teddy = Dog.new('teddy')
puts teddy.warm_blooded?
puts teddy.can_swim?

kitty = Cat.new('kitty')

