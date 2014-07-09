# 1 

[1,2,3,4,5,6,7,8,9,10].each{|num| puts num}

# 2

a = [1,2,3,4,5,6,7,8,9,10]
a.select{|num| puts num if num > 5}


a.select do |num|
  if num > 5
    puts num
  end
end
