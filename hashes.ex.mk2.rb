persons = {name: "Jason", age: 37, weight: "11 stone", height: "5 foot 11 inches" }

persons.each do |key, value|
  puts "person contains #{key} with a value of #{value}"
end


def greeting(name, options = {})
  if options.empty?
    puts "Hi my name is #{name}"
  else
    puts "Hi my name is #{name} and I am #{options[:age]} and I live in #{options[:city]}."
  end
end

greeting("Jason")
greeting("Bob", {age: 37, city: "Ipswich"})

p persons.to_a


p persons.keys
p persons.values

# 1 

family = {
  uncles: ["Merv", "Kev", "Gerry"],
  sisters: ["Emma"],
  parents: ["Brian", "Diane"],
  aunts: ["Mandy", "Trina", "Debbie", "Carol", "Linda", "Christine"]
}

i_family = []

i_family = family.select do |key,value| 
  key == :sisters || key == :parents
end

arr = i_family.flatten

p i_family
p arr

# 2 

array1 = {"a" => 1, "b" => 2, "c" => 3}
array2 = {"d" => 4, "e" => 5, "f" => 6}

p array1.merge(array2)

array1.merge!(array2)
p array1
p array2

# 3 
array1.each{|k,v| puts "#{k} is a key in the array1 hash."}
array1.each{|k,v| puts "#{v} is a value in the array1 hash"}
array1.each{|k,v| puts "#{k} is a key in the array1 hash and #{v} is a value in the array1 hash"}

array1.each_key{|k| puts k}
array2.each_value{|v| puts v}

# 4 
p persons[:name]

# 5
puts persons.has_value?("Jason")

# 6 

words = ["demo", "none", "tied", "evil", "dome", "mode", "live", "fowl", "veil", "wolf", "diet", "vile", "edit", "tide", "flow", "neon"]


result = {}

words.each do |word|
  key = word.split(//).sort.join
  if result.has_key?(key)
    result[key] << word
  else
    result[key] = [word]
  end
end

result.each do |k,v|
  puts "-------"
  puts "#{k}: #{v}"
end

# cycle through each element in array and take the letters into a new variable sorted in alphabetical order. 
# Compare that variable with the other words in the array and then sot it into an array accordingly.


