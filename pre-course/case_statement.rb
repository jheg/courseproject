# case_statement.rb <- refactored

a = 5

answer = case a
when 5
  puts "a is 5"
when 6
  puts "a is 6"
else
  puts "a is neither 5, nor 6"
end

puts answer

b = false

if b 
  puts "how can this be true?"
else
  puts "it is not true"
end
