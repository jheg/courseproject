# start new game
# player picks hand ( paper(p), rock(r) or scissors(s) ) 
# opponent picks hand
# result
# play again



# PLAYER CLASS HOLDS PLAYERS CHOICE
class Player
  attr_reader :name
  attr_accessor :value

  def initialize
    @name = 'Player'
    @value = ''
  end

  def pick_hand
    begin 
      puts "PICK PAPER(P), ROCK(R) OR SCISSORS(S)"
      choice = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(choice)
    self.value = Game::CHOICES[choice]
  end

  def to_s
    "#{self.name} has #{self.value}"
  end
end

# COMPUTER CLASS HOLDS COMPUTERS CHOICE
class Computer
  attr_reader :name
  attr_accessor :value

  def initialize
    @name = 'Computer'
    @value = ''
  end

  def pick_hand
      choice = Game::CHOICES.keys.sample
      self.value = Game::CHOICES[choice]
  end

  def to_s
    "#{self.name} has #{self.value}"
  end
end



class Game
  CHOICES = { 'p' => 'paper', 'r' => 'rock', 's' => 'scissors' }

  attr_accessor :player, :computer, :hand
  attr_reader :name

  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def compare(player_choice, computer_choice)
    if player_choice == computer_choice
      "Tie!"
    elsif player_choice == 'paper' && computer_choice == 'rock' || player_choice == 'rock' && computer_choice == 'scissors' || player_choice == 'scissors' && computer_choice == 'paper'
      "YOU WIN!"
    else
      "COMPUTER WINS :("  
    end
  end

  def play
    replay = 'y'
    begin
      player.pick_hand
      computer.pick_hand
      puts player
      puts computer
      puts compare(player.value, computer.value)
      puts "PLAY AGAIN? (Y/N)"
      replay = gets.chomp.downcase
    end until replay != 'y'
  end
end

game = Game.new.play 



