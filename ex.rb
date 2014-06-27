# excersize 1

my_array = [1,2,3,4,5,6,7,8,9,10]

# one line example
my_array.each{|i| puts "number #{i} exists"}

# multiline example
my_array.each do |number|
  puts "The number is #{number}"
end

# excersize 2 same as above but only print out numbers greater than 5

# single line
my_array.each{|i| puts "#{i} is" if i > 5}

# multiline
my_array.each do |number|
  if number > 5
    puts "#{number} is greater than 5"
  end
end

# excersize 3 using the select method create a new array of odd numbers from my_array

# single line 
new_array = my_array.select{|o| o.odd?}

# multiline 
odd_array = my_array.select do |num|
  num % 2 != 0
end


puts new_array
puts odd_array


# excersize 4

my_array.push(11)
puts my_array
my_array.unshift(0)
puts my_array

# excersize 5 get rid of 11 and append 3

my_array.pop
my_array << 3
puts my_array

# excersize 6 get rid of duplicates without getting rid of removing any one value

my_array.uniq!
puts my_array

# excersize 7 create a hsh using both ruby syntax styles

hash_one = {:name => "Bob"}

hash_two = {name: "Jason"}

# excersize 8

h = {a: 1, b: 2, c: 3, d: 4}

puts h[:d]

h[:e] = 5

puts h

# single line

h.each{|key,value| h.delete(key) if value < 3.5}
puts h

# better

h.delete_if{|k,v| v < 3.5}

# multiline
h.each do |k, v|
  if v < 3.5 
    h.delete(k)
  end
end

puts h

# excersize 9 can hashes have values that are arrays and can arrays have values that are hashes?

hash = {
  :team => "Ipswich",
  :league => "Championship",
  :titles => array = [2001, 1976, 1981, 1962, 1961]
}

puts hash

array = ["Ipswich", kit = {:socks => "blue", :shorts => "white", :shirt => "blue"}] # hash didnt need to be assigned to work same in the hash above

puts array

# excersize 10

contact_data = [
  ["joe@email.com", "123 Main st.", "555-123-4567"], 
  ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]
] 
contacts = {
  "Joe Smith" => {}, 
  "Sally Johnson" => {}
}

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:tel] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:tel] = contact_data[1][2]



puts contacts

# excersize 11 accessing Joes email and Sallys tel number

puts contacts["Joe Smith"][:email]
puts contacts["Sally Johnson"][:tel]


# excersize 12 using a loops instead of assignment to create the data structure

contact_info = ["joe@mail.com", "20 Park Avenue", "3499"]
the_contact = {"Joe" => {}}
fields = [:email, :adress, :telephone]

the_contact.each do |name, hash|
  fields.each do |field|
    hash[field] = contact_info.shift
  end
end

puts "This hash contains #{the_contact}"

# excersize 13

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees'] 

arr.delete_if{|string| string.start_with?('s', 'w')}

puts arr

# excersize 14

a = ['white snow', 'winter wonderland', 'melting ice', 'slippery sidewalk', 'salted roads', 'white trees']

b = a.map { |e| e.split }

b = b.flatten

p b

# excersize 15

f = {shoes: "nike", "hat" => "adidas", :hoodie => true}
g = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if f == g
  puts "f and g are the same"
else
  puts "f and g ae different"
end














