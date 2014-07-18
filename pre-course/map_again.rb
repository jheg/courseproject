def test(b)
  b.map{|letter| "I love the letter #{letter}!"}
end

a = ['a','b','c']
b = a
puts test(a)
puts a
puts b
