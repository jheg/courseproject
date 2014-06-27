# arrays excersizes

arr = [1,2,3,4,5,6]

number = 3

arr.each do |num|
  if num == number
    puts "The number #{number} certainly does exist in the array"
  end
end

if arr.include?(number)
  puts "#{number} is in the array"
end


array_one = [0,10,20,30,40,50,60,70]

array_two = []

array_one.each do |i|
  array_two << i + 2
end

p array_one
p array_two

a_1 = [37,36,6,1]
a_30 = []

for i in a_1 do 
  a_30 << i + 30
end

p a_1
p a_30
