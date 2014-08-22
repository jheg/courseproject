require 'pry'

def say(msg)
  puts "--- #{msg} ---"
end

objects = %w(Paper Rock Scissors)
again = 'y'

while again == 'y'

  puts "Choose One: (P/R/S)"
  ans = gets.chomp
  ans.upcase!

    while ans != 'P' && ans != 'R' && ans != 'S'
      puts "Choose One: (P/R/S)"
      ans = gets.chomp
    end

    if ans == "P"
      users_choice = objects[0]
    elsif ans == "R"
      users_choice = objects[1]
    else
      users_choice = objects[2]
    end
    

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
    elsif users_choice == "Rock" && comp == "Paper"
      puts "#{comp} covers #{users_choice}"
      puts "You lose!"
    elsif users_choice == "Rock" && comp == "Scissors"
      puts "#{users_choice} blunts #{comp}"
      puts "You win!"
    elsif users_choice == "Scissors" && comp == "Paper"
      puts "#{users_choice} cuts #{comp}"
      puts "You win!"
    elsif users_choice == "Rock" && comp == "Scissors"
      puts "#{comp} blunts #{users_choice}"
      puts "You lose!"
    end

puts "Play again? (Y/N)"
again = gets.chomp

end








