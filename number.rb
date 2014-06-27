# Takes a number from the user and returns if that number is between 0-50, 51-100 or higher than 100

def req_num(number)
  if number < 51
    "between 0 and 50"
  elsif number < 101
    "between 51 and 100"
  else
    "above 100"
  end
end

puts "enter a number"
puts req_num(gets.chomp.to_i)

# tutorial answer

puts "Please enter a number between 0 and 100."
num = gets.chomp.to_i

def req_num_t(num)
  if num < 0
    puts "You can't enter a negative number!"
  elsif num <= 50
    puts "#{num} is between 0 and 50"
  elsif num <= 100
    puts "#{num} is between 51 and 100"
  else
    puts "#{num} is above 100"
  end
end

puts req_num_t(num)

# as above in a case statement

def req_num_case1(n1)
  case 
  when 0 .. 50
    "#{n1} is between 0 and 50"
  when 51 .. 100
    "#{n1} is between 51 and 100"
  else
    "#{n1} is above 100"
  end
end

puts req_num_case1(gets.chomp.to_i)

