module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak('Woooof')

bob = HumanBeing.new
bob.speak('Shhhh sparky')

puts "------GoodDog ancestors------"
puts GoodDog.ancestors
puts
puts "------HumanBeing ancestors-------"
puts HumanBeing.ancestors
puts

# using modules for namespacing ( grouping classes that are similar )
module Mammals
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end
  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end

buddy = Mammals::Dog.new
buddy.speak('Hoooowl')
kitty = Mammals::Cat.new
kitty.say_name('kitty')


# Q1 How do we create an object in ruby?

class SomeClass
end

puts SomeClass.ancestors
some_variable = SomeClass.new

# Q2 What is a module? What is its purpose? How do we use them with classes? Create a module for the class above

module SomeModule 
end

class SomeClass
  include SomeModule # mixin 
end

another_var = SomeClass.new

puts SomeClass.ancestors
