# pracrice_each.rb

names = ["Jason", "Victoria", "Charlie", "Annie"]

names.each { |name| puts name}

for n in names do
  puts n
end 


i = 1 
names.each do |first_name|
  puts "#{i}. #{first_name}"
  i += 1
end
