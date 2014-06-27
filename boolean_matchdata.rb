# boolean_matchdata.rb

def has_a_b(string)
  if /b/.match(string)
    puts "MATCH!"
  else
    puts "no match"
  end
end

has_a_b("Jason Hegarty")
has_a_b("Barbara Rance")

t = Time.new(2008,4,4)

if t.monday?
puts "Monday"
elsif t.tuesday?
puts "Tuesday"
elsif t.wednesday?
puts "Wednesday"
elsif t.thursday?
puts "Thursday"
elsif t.friday?
puts "Friday"
elsif t.saturday?
puts "Saturday"
else
puts "Sunday"
end
 