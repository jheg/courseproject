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

x = ''

while x != "STOP" do
  puts "want me to ask again?"
  x = gets.chomp.upcase # added this so user can enter stop, sToP, STop etc
end

# 3 

my_array = ["Jason", "Vic", "Charlie", "Annie"]

my_array.each_with_index do |item, i|
  puts "#{i + 1}: #{item}"
end

# 4 

def count_to_zero(num)
  if num <= 0
    puts num
  else
    puts num
    count_to_zero(num - 1)
  end
end

count_to_zero(20)
count_to_zero(-3)









