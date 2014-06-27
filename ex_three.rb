# excersize
# A program that contains a method called greeting and takes name as its parameter and then prints out a greeting message with name included in it.

def greeting(name)
  "Hello #{name}, I'm bot"
end

puts greeting("Jason")


# multiply method that takes two numbers and returns the value of the two numbers

def multiply(number1, number2)
  number1 * number2
end

puts multiply(5,5)

def scream(words)
  words = words + "!!!!!"
  # return # nothing after this within the method will get executed
  puts words
end

scream("Yipeeeee")



