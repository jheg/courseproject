# 1

x = [1,2,3,4,5]

x.each do |a|
  puts "array contains #{a}"
  a + 1
end

# 2

# puts "Enter a word or STOP to end the program"
# word = gets.chomp

# while word
#   if word != "STOP"
#     puts "Enter another!"
#     word = gets.chomp  
#   elsif word == "STOP"
#     puts "Program finished"
#     exit
#   end
# end

# 3 

my_array = ["Jason", "Vic", "Charlie", "Annie"]

my_array.each_with_index do |item, i|
  puts "#{i + 1}: #{item}"
end

# 4 

def count_to_zero(num)
  while num > 0
    puts num
    num = num - 1
  end
end

count_to_zero(20)
count_to_zero(-3)




