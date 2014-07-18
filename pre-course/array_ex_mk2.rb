# 1
arr = [1,3,5,7,9,11]
number = 3

puts arr.include?(number)

arr.each do |i|
  if i == number
    puts "#{number} exists in #{arr}"
  end
end

# 2 the first will return the modified array and the second will return the deleted item.
arr = ['a', 'b']
arr = arr.product(Array(1..3))
p arr
arr.first.delete(arr.first.last)
p arr
arr.first << 1
p arr

# the first will return the modified array with each element of arr the product of Array inside an array like [['a', [1,2,3]], ['b', [1,2,3]]]
# the second will delete the the element of the first element (an array of 1,2,3) 
arr = ['a','b']
arr = arr.product([Array(1..3)])
p arr
arr.first.delete(arr.first.last)
p arr

# 3
arr = [["test","hello","world"],["example","mem"]]
puts arr[1][0]
# or
p arr.last.first

# 4 
arr = [15,7,18,5,12,8,5,1]
arr.index(5) # returns 3
# arr.index[5] # returns error
arr[5] # returns 8

# 5 
string = "Welcome to Tealeaf Academy!"
a = string[6]
b = string[11]
c = string[19]

p a
p b 
p c

# 6 
names = ["bob", "joe", "jason"]
names[0] = "jack"
p names

names.select do |name|
  if name == 'jack'
    names.delete('jack')
    names.unshift('bob')
  end
end

p names

# 7

a = [1,2,3,4,5]

b = a.map{|i| i + 1}

p a
p b

# or 

c = [10,20,30,40,50,60]
d = []

c.each do |n|
  d << n + 1
end

p c
p d



