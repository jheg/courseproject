module Speak
  def speak(sound)
    "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

puts GoodDog.ancestors

# jason = HumanBeing.new
# puts jason.speak("Hey how's it going?")

# cassie = GoodDog.new
# puts cassie.speak("ARRF!")

# EXCERSIZES

# 1 cretae and object
# class ClassName 
# end
# var = ClassName.new

# 2 What is a module? What is its purpose? create ne and inclide for ex 1

# module ModuleName
#   def some_method
#   end
# end

# class ClassName
#   include ModuleName
# end
