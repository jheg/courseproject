# each_with_index.rb

names = %w(Jason Victoria Charlie Annie)

names.each_with_index do |name, index|
  puts "#{index + 1}: #{name}"
end


# a method that counts down to zero with recursion


def countdown(number)
  if number == 0
    puts "Lift Off!"
  elsif number < 0
    puts "You cannot enter a negative number please try again and enter a positive number:" 
    countdown(gets.chomp.to_i)
  else
    puts number
    countdown( number - 1)
  end
 
end


countdown(-1)

array_1 = %w(1 2 3 4 5)
array_2 = []

i = 0
