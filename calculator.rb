# require 'pry'

def say(msg)
  puts "=> #{msg}"
end

say "What's the first number?"
num1 = gets.chomp
puts "the number is #{num1}"

say "What's the second number?"
num2 = gets.chomp
puts "The second number is #{num2}"

say "1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp


while operator.to_i != 1 && operator.to_i != 2 && operator.to_i != 3 && operator.to_i != 4
  say "you need to enter a number"
  say "1) add 2) subtract 3) multiply 4) divide"
  operator = gets.chomp
end

# binding.pry

if operator.to_i == 1
  puts "you chose to add #{num1} to #{num2} which equals #{num1.to_i + num2.to_i}"
elsif operator.to_i == 2
  puts "you chose subtract #{num2} from #{num1} which equals #{num1.to_i - num2.to_i}"
elsif operator.to_i == 3
  puts "you chose multiply #{num1} with #{num2} which equals #{num1.to_i * num2.to_i}"
else
  puts "you chose divide #{num1} by #{num2} which equals #{num1.to_f / num2.to_f}"
end

