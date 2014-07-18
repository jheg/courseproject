# ex 3

hash1 = {lenders: ["Santander", "Halifax", "Nationwide Building Society"] }


puts "display keys"
hash1.each_key{|key| puts key}
puts "display values"
hash1.each_value{|value| puts value}
puts "display both"
hash1.each {|key, value| puts "The hash has the keys: #{key} and values: #{value}"}


puts hash1.first.last.include?("string1")

if hash1.has_value?(["Santander", "Halifax", "Nationwide Building Society"])
  puts "Lender does indeed exist!"
else
  puts "nope"
end
