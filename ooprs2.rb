
# start new game
# ask players name
# introduce opponent from random opponents
# display info regarding current oponent wins/ties/losses
# player picks hand ( paper(p), rock(r) or scissors(s) ) 
# opponent picks hand
# result
# play again

def say(msg)
  puts "-----#{msg}-----"
end

# SHARED PLAYER CLASS
class Player
  @@num = 0 
  attr_accessor :option, :name
  def initialize(name, option)
    @total_wins = 0
    @total_losses = 0
    @total_ties = 0    
    @name = name
    @option = option
    @@num += 0.5
  end
  def msg
    puts "#{name} chooses #{option}"
  end
  def self.info
    puts "Games = #{@@num.to_i}"
  end
end

# PLAYER
class Human < Player
end

module OpponentsTally
  def message
    "#{name} has won #{@total_wins}, lost #{@total_losses} and tied #{@total_ties} games."
  end 
  def stats_update(w,l,t)
    @total_wins += w
    @total_losses += l
    @total_ties += t
  end
end

class Opponent < Player
  attr_accessor :total_wins, :total_ties, :total_losses, :option
  def inialize
    @total_wins = 0
    @total_losses = 0
    @total_ties = 0
  end
  include OpponentsTally
end

# GAME INITIALISATION 
tony = Opponent.new("Tony", ["p","r","s"].sample)
frank = Opponent.new("Frank", ["p","r","s"].sample)
dudley = Opponent.new("Dudley", ["p","r","s"].sample)

# WELCOME MESSAGE
say 'Welcome to Paper, Rock, Scissors'
sleep 0.5

# PLAYER CREATED AND GAME STARTS
puts 'What is your name?'
player = gets.chomp

play_again = 'y'
until play_again != 'y'

  puts "Hi #{player}, please choose Paper(p), Rock(r) or Scissors(s)"
  opt = gets.chomp
  player_object = Human.new(player, opt)
  
  # OPPONENT CREATED AND INTRODUCED
  the_opponent = [tony, frank, dudley].sample
  say "#{the_opponent.name} is your opponent for this game"
  sleep 1
  puts the_opponent.message
  sleep 1

  # CHOICES SUMMARY
  player_object.msg
  sleep 0.75
  the_opponent.msg
  sleep 0.75

  # RESULT & UPDATE STATS
  if player_object.option == the_opponent.option
    puts "DRAW"
    the_opponent.stats_update(0,0,1)
  elsif player_object.option == 'p' && the_opponent.option == 'r'
    puts "PAPER WRAPS ROCK AND STRANGELY THAT MEANS YOU WIN I SUPPOSE"
    the_opponent.stats_update(0,1,0)
  elsif player_object.option == 'r' && the_opponent.option == 's'
    puts "ROCK TOTALLY SMASHES SCISSORS YOU WIN"
    the_opponent.stats_update(0,1,0)  
  elsif player_object.option == 's' && the_opponent.option == 'p'
    puts "SCISSORS CUTS THROUGH PAPER YOU WIN"
    the_opponent.stats_update(0,1,0)    
  elsif player_object.option == 'p' && the_opponent.option == 's'
    puts "SCISSORS CUT PAPER AND YOU HAVE PAPER YOU LOSE"
    the_opponent.stats_update(1,0,0)
  elsif player_object.option == 'r' && the_opponent.option == 'p'
    puts "PAPER COVERS ROCK YOU LOSE"
    the_opponent.stats_update(1,0,0)
  elsif player_object.option == 's' && the_opponent.option == 'r'
    puts "YOUR SCISSORS GET SMASHED BY ROCK YOU LOSE"
    the_opponent.stats_update(1,0,0)
  end

  # puts Player.info
  say "PLAY AGAIN? (y/n)"
  play_again = gets.chomp
end



