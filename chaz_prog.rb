puts "Hello what is your name?"
puts "Enter your name..."
name = gets.chomp
if name == 'poo'
  puts "Well you do smell like poo :)"
else
  puts "Hello #{name}, nice to meet you!"
end
puts "Tell me your favourite colour"
colour = gets.chomp
if colour == "blue"
  puts "THATS MY FAVOURITE COLOUR TOO!!!"
else
  puts "#{colour} is a nice colour"
end
puts "How old are you?"
age = gets.chomp.to_i
my_age = 37
if age > my_age && age <= my_age + 63
  diff = age - my_age
  puts "You are #{diff} year(s) older than me!"
elsif age < my_age
  diff = my_age - age
  puts "You are #{diff} year(s) younger than me!"
elsif age >= (my_age + 63)
  puts "Don't be silly this is not a game #{name}!"
else
  puts "That's how old I am!!!"
end

