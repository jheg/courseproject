#boolean_regex.rb

def has_a_b(string)
  if string =~ /b/
    puts "We have a match"
  else
    puts "We have no match"
  end
end

has_a_b("Jason")
has_a_b("Charlie")
has_a_b("Barbara")

