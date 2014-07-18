# 1

# false
# false
# false
# true
# true

# 2

def cap_if_ten(word)
  if word.length >= 10
    puts word = word.capitalize
  else
    puts word
  end
end

cap_if_ten("roundabout")

# 3

puts "Enter a number between 0 and 100"
number = gets.chomp.to_i

answer = case 
when number < 50
  "your number was less than 50"
else
  "your number is above 50"
end

puts answer

# 4

# "FALSE"
# "Did you get it right?"
# "Alright now!"

# 5 

# if
def eval_num(num)
  if num <= 50
    puts "#{num} is 50 or less"
  else
    puts "#{num} is 51 or above"
  end
end


# case

def eval_num2(num)
  case num
  when 0..50
    puts "#{num} is 50 or less"
  when 51..100
    puts "#{num} is between 51 and 100"
  when ->(num){num < 0} # lambda
    puts "#{num} cannot be less than 0 please try again"
    puts "Enter a number BETWEEN 0 and 100"
    num = gets.chomp.to_i
    eval_num2(num)
  else
    puts "#{num} is above 100 try again"
    puts "Enter a number BETWEEN 0 and 100"
    num = gets.chomp.to_i
    eval_num2(num)
  end
end

puts eval_num(30)
puts eval_num2(-1)
puts eval_num2(1)
puts eval_num2(100)
puts eval_num2(120)

# 6 

# missing an end




























