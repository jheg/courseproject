# 1 

[1,2,3,4,5,6,7,8,9,10].each{|num| puts num}

# 2

a = [1,2,3,4,5,6,7,8,9,10].select{|num| num > 5}
puts a

[1,2,3,4,5,6,7,8,9,10].select do |num|
  if num > 5
    puts num
  end
end
