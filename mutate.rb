 # Example of a method that modifies its argument permeanently 
 # mutate.rb

 a = [1,2,3]

def mutate(array)
  array.pop
end

p "Before mutate method: #{a}" # quotation marks
puts "Before mutate method: #{a}. Using 'puts' opposed to 'p'" # no quotation marks
p mutate(a)

p "After mutate method: #{a}"

# Example of a method that does not mutate the caller

b = [1,2,3]

def no_mutate(array)
  array.last
end

p "Before no_mutate method: #{b}"
p no_mutate(b)
p "After no_mutate method: #{b}"
