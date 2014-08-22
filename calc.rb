require 'pry'

def say(msg)
  puts "------ #{msg} ------"
end

say "What is the first number?"
num1 = gets.chomp

say "What is the second number?"
num2 = gets.chomp

say "1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

[1,2,3].each do |e|
  count = e
  puts count
end


binding.pry

if operator == '1'
  puts "#{num1} + #{num2} = #{num1.to_i + num2.to_i}"
elsif operator == '2'
  puts "#{num1} - #{num2} = #{num1.to_i - num2.to_i}"
elsif operator == '3'
  puts "#{num1} * #{num2} = #{num1.to_i * num2.to_i}"
else
  puts "#{num1} / #{num2} = #{num1.to_f / num2.to_f}"
end

