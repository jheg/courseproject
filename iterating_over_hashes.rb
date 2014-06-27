# iterating_over_hases.rb

person = {name: "Jason", height: "6 ft", weight: "11 stone", hair: "brown"}

person.each do |key, value|
  puts "Jason's #{key} is #{value}"
end
