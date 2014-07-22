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

if operator.to_i != 1 || operator.to_i != 2 || operator.to_i != 3 || operator.to_i != 4
  say "you need to enter a number"
  say "1) add 2) subtract 3) multiply 4) divide"
  operator = gets.chomp
elsif operator.to_i == 1
  puts "you chose to add #{num1} to #{num2}"
elsif operator.to_i == 2
  puts "you chose subtract #{num2} from #{num1}"
elsif operator.to_i == 3
  puts "you chose multiply #{num1} with #{num2}"
else
  puts "you chose divide #{num1} by #{num2}"
end

