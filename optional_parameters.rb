# optional_parameters.rb

age = 38


def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]} years old and I live in #{options[:city]}."
  end
end 

greeting("Bob", {age: 37, city: "Ipswich"})   
greeting("Jason Hegarty", age: 37, city: "Ipswich")
greeting("Victoria Rance", age: age, city: "Ipswich")

