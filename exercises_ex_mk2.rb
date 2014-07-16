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

# 3

new_array = []

a.select do |number|
  if number.odd?
    new_array << number
  end
end
puts "-------" 
puts new_array
puts "-------" 
# ^ my effort
# \/ course solution
c = a.select{|n| n % 2 != 0}
puts "-------" 
puts c 
puts "-------"


# 4 

a << 11
a.unshift(1)
puts "------"
puts a 
puts "------"

# 5 

a.pop
a << 3
puts "--------"
puts a
puts "--------"

# 6 

a.uniq!
puts "--------"
puts a
puts "--------"

# 7 

# old method
h1 = {:one => 1, :two => 2}
# new method
h2 = {one: 1, two: 2}

h1[:three] = 3
h1[:four] = 5

puts "-----"
puts h1
puts "-----"

h1.delete_if{|key, value| value < 3.5}

puts "-----"
puts h1
puts "-----"

# 8 

# hash values as arrays

my_hash = {key1: [1,2,3,4,5], key2: "a string", key3: 50}
my_array = ['Terry','June', {key1: 1, key2: 2}]

puts "-----"
puts my_hash
puts my_array
puts "-----"

# 9

contact_data = [
  ["joe@email.com", "123 Main st.", "555-123-4567"],
  ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]
] 
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts["Joe Smith"] = {email: contact_data[0][0], address: contact_data[0][1], tel: contact_data[0][2]}
contacts["Sally Johnson"] = {email: contact_data[1][0] ,address: contact_data[1][1] ,tel: contact_data[1][2]}

contacts.each{|k,v| puts v}

# 10 

contacts["Joe Smith"].each do |k,v| 
  if k == :email 
  puts v
  end
end

contacts["Sally Johnson"].each do |k,v|
  if k == :tel
    puts v 
  end
end

puts "Joes email is #{contacts["Joe Smith"][:email]}"

# 11
peeps = {"Jason Hegarty" => {}, "Victoria Rance" => {}}
peeps_data = [["37", "jason@jheg.co.uk", "48 The Strand"], ["36", "emailrance@gmail.com", "48 The Strand"]]
fields = [:age, :email, :address]

peeps.each do |name,hash|
  if peeps["Jason Hegarty"]
    fields.each do |field|
        hash[field] = peeps_data.first.shift
        puts "-----"
        puts peeps_data
        puts "-----"
    end
  elsif peeps["victoria Rance"]
    fields.each do |field|
        hash[field] = peeps_data.last.shift
        puts "-----"
        puts peeps_data
        puts "-----"
    end
  end
end

puts peeps
  


