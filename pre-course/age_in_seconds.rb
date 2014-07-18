# age_in_seconds.rb


puts "Enter how many years old you are:"
i = gets.chomp.to_i

def age_in_sec(i)
  secs = i * 365 * 24 * 60 * 60
end

puts "You are #{age_in_sec(i)} seconds old!"

