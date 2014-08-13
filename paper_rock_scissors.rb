require 'pry'

def say(msg)
  puts "--- #{msg} ---"
end


objects = %w(Paper Rock Scissors)
p = 0
r = 1
s = 2

again = 'y'

while again == 'y'

  puts "Choose One: (P/R/S)"
  ans = gets.chomp
  while ans != 'p' && ans != 'r' && ans != 's'
    puts "Choose One: (P/R/S)"
    ans = gets.chomp
  end
  users_choice = objects[ans.to_i]
  comp = objects.sample
  say("You chose #{users_choice}")
  say("Computer chose #{comp}")


  if users_choice == comp  
    puts "You picked #{users_choice} and computer picked #{comp}"
    puts "its a draw!"
  elsif
    users_choice == "Paper" && comp == "Rock"
    puts "#{users_choice} covers #{comp}"
    puts "You win!"
  elsif users_choice == "Paper" && comp == "Scissors"
    puts "#{comp} cuts #{users_choice}"
    puts "You lose!"
  else
    puts "something else"
  end
  
puts "Play again? (Y/N)"
again = gets.chomp

end








