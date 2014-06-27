# a program that keeps outputting what the user types in until the type "STOP"

word = gets.chomp

while word
  if word == "STOP"
  break
  else
  puts word
  end
  word = gets.chomp 
end

# exercise answer

x = ""
while x != "STOP" do
  puts "Hi, How are you feeling?"
  ans = gets.chomp
  puts "Want me to ask you again?"
  x = gets.chomp
end

