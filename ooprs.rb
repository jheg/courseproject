# 1. Have detailed requirements or specifications in written form.
# 2. Extract major nouns -> classes
# 3. Extract major verbs -> instance methods
# 4. Group instance methods into classes

class Paper
  attr_accessor :paper

  def initialize
    @paper = 'paper'
  end

  def to_s
    "#{paper}"
  end
end

class Rock
  attr_accessor :rock

  def initialize
    @rock = 'rock'
  end

  def to_s
    "#{rock}"
  end
end

class Scissors
  attr_accessor :scissors

  def initialize
    @scissors = 'scissors'
  end

  def to_s
    "#{scissors}"
  end
end

# run game
# choose p/r/s
# computer chooses p/r/s
# who wins?
# play again?

class PaperRockScissors

  @@play_again = 'y'

  def result(p,o)
    if p.class == o.class 
      puts "It's a tie!"
    elsif p.class == Paper && o.class == Rock
      puts "Paper covers rock - Player Wins!"
    elsif p.class == Paper && o.class == Scissors
      puts "Scissors cuts paper - Opponent wins."
    elsif p.class == Rock && o.class == Scissors
      puts "Rock smashes scissors - Player wins!"
    elsif p.class == Rock && o.class == Paper
      puts "Paper covers rock - Opponent wins."
    elsif p.class == Scissors && o.class == Paper
      puts "Scissors cuts paper - Player wins!"
    elsif p.class == Scissors && o.class == Rock
      puts "Rock smashes scissors - Opponent wins."
    end
  end    
  
  def play_game
    until @@play_again != 'y'        
      puts "Choose Paper(p),Rock(r) or Scissors(s)"
      ans = ''
      ans = gets.chomp until ans == 'p' || ans == 'r' || ans == 's'
      if ans == 'p'
        p = Paper.new
      elsif ans == 'r'
        p = Rock.new
      elsif ans == 's'
        p = Scissors.new
      end
      o = [Paper, Rock, Scissors].sample.new
      puts "You chose #{p}"
      puts "Opponent chooses #{o}"

      result(p,o)

      puts "play again?"
      @@play_again = gets.chomp
    end
   
  end

end

PaperRockScissors.new.play_game

