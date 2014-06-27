array = [1,4,34,22,12,67,34,6]

if array.length.odd?
  i = array.length / 2 
  puts "The median is #{array[i]}"
else
  i = array.length / 2 - 1
  i2 = array.length / 2 
  puts "The median is #{array[i]} and #{array[i2]}"
end



