# TAKES CARE OF BOARD CREATION, AVAILABLE SQUARES, POPULATING SQUARES
class Board
  attr_accessor :squares

  def initialize
    @squares = Array.new(9){' '}
  end

  def draw_board
    five = ' '*5
    two = ' '*2
    system 'clear'
    puts five + '|' + five + '|' + five
    puts two + "#{self.squares[0]}" + two + '|' + two + "#{self.squares[1]}" + two + '|' + two + "#{self.squares[2]}" + two
    puts five + '|' + five + '|' + five
    puts "-" * 5 + '+' + '-' * 5 + '+' + '-' * 5
    puts five + '|' + five + '|' + five
    puts two + "#{self.squares[3]}" + two + '|' + two + "#{self.squares[4]}" + two + '|' + two + "#{self.squares[5]}" + two
    puts five + '|' + five + '|' + five
    puts "-" * 5 + '+' + '-' * 5 + '+' + '-' * 5
    puts five + '|' + five + '|' + five
    puts two + "#{self.squares[6]}" + two + '|' + two + "#{self.squares[7]}" + two + '|' + two + "#{self.squares[8]}" + two
    puts five + '|' + five + '|' + five
  end

  def take_square(player, number)
    if player.name == 'human'
      @squares[number] = 'x'
      draw_board
    else
      @squares[number] = 'o'  
      draw_board
    end
  end

  def available_squares
    self.squares.select{|square| square == ' '}
  end
end

# GIVES EACH PLAYER AN IDENTITY 
class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

# CONTAINS ALL OF THE GAMEPLAY AND INTELLIGENCE
module GamePlay

  def players_turn
    puts "CHOOSE AN EMPTY SQUARE BETWEEN 1 & 9"
    answer = gets.chomp.to_i - 1
    if board.squares[answer] == ' '
      @board.take_square(human , answer)
      check_for_winner('x', human.name)
    else
      players_turn
    end
  end

  def computers_turn
    if board.squares.any? { |e| e == ' ' }
        comp_choice = board.squares.each_index.select{|index| board.squares[index] == ' '}.sample
        @board.take_square(c3po , comp_choice)
        check_for_winner('o', c3po.name)
    end
  end

  def check_for_winner(marker, player)
    Game::WINNING_LINES.each do |array|
      if board.squares[array[0]] == marker && board.squares[array[1]] == marker && board.squares[array[2]] == marker
        puts "#{player} wins"
        sleep 1
        exit
      end
    end
  end

end

# THE GAME CLASS
class Game
  include GamePlay

  WINNING_LINES = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

  attr_accessor :squares, :board, :human, :c3po

  def initialize
    @board = Board.new
    @human = Player.new('human')
    @c3po = Player.new('C3PO')
  end

  def play
    @board.draw_board
    first_go = [human, c3po].sample
    puts "#{first_go.name} goes first"
    sleep 0.5
    while board.squares.any? { |e| e == ' ' }
      if first_go.name == 'human'
        players_turn
        sleep 0.5
        computers_turn
        sleep 0.5
      else
        computers_turn
        sleep 0.5
        players_turn
        sleep 0.5
      end
    end
  end
end

Game.new.play

# FEATURES TO ADD:
# - PRINT MESSAGE IN EVENT OF NO check_for_winner
# - MAKE THE OPPONENT SMARTER THAN RANDOM

