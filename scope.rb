require 'pry'
var1 = "some string."

puts "---- before method ----"
puts "#{var1}"

def change(var)
  var.capitalize!
end


puts "---- method called ----"
change(var1)

puts "---- after method ----"
puts var1


a = [1,2,3,3.5,4,5,5 ,5 ,5 ,5 ,5]

def not_mutate(ary)
  ary.uniq
  puts ary
end

def mutate(ary)
  ary.uniq!
  puts ary
end

puts "--- !mutate ---"
not_mutate(a)
puts "--- mutate ---"
mutate(a)

puts a