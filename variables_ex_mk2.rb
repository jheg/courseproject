# 1 ask for name print out message

puts "Enter your name and press Enter!"
name = gets.chomp
puts "Hey #{name}"

# 2 ask for a users age and tell them how old they'll be in 10, 20 and 30 years

puts "How old are you?"
age = gets.chomp.to_i
puts "In 10 years you'll be #{age + 10}"
puts "In 10 years you'll be #{age + 20}"
puts "In 10 years you'll be #{age + 30}"

# 3 output the persons name 10 times

10.times do
  puts name
end

# 4 1st and 2nd name then output both

puts "first name?"
first_name = gets.chomp
puts "surname?"
surname = gets.chomp
puts first_name + " " + surname

# 5 

y = 0

3.times do
  y += 1 
  x = y 
end 

puts x 

# 6 

