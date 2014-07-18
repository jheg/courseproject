# 1

def greeting(name)
  puts "Hello #{name} how are you?"
end

name = gets.chomp
greeting(name)

# 2

# 1. x = 2 
# => 2
# 2. puts x = 2 
# nil
# 3. p name = "Joe" 
# => "Joe"
# 4. four = "four" 
# => "four"
# 5. print something = "nothing" 
# => nil

# 3 

def multiply(num1, num2)
  num1 * num2
end

puts multiply(5,4)

# 4 
 
# nil.

# 5

def scream(word)
  word = word + "!!!!!!"
  puts word
end

scream("Jason")

# still returns nil
