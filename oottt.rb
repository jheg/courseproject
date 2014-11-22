require('pry')
require('pry-nav')

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

  # takes player and number and assigns that players marker to the board array
  def take_square(player, number)
    marker = player.name == 'human' ? 'x' : 'o'
    self.squares[number] = marker
    draw_board
  end

  # returns an array of empty squares (squares that == ' ') 
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

# THE GAME CLASS
class Game
  WINNING_LINES = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

  attr_accessor :squares, :board, :human, :c3po

  def initialize
    @board = Board.new
    @human = Player.new('human')
    @c3po = Player.new('C3PO')
  end

  def players_turn
    puts "CHOOSE AN EMPTY SQUARE BETWEEN 1 & 9"
    answer = gets.chomp.to_i - 1
    if board.squares[answer] == ' '
      @board.take_square(human , answer)
    else
      players_turn
    end
    check_for_winner('x', human.name)
  end

# 1. ATTACK?
# 2. DEFEND?
# 3. TAKE OPTIMUM SQUARE (WHERE THERE IS 1 'o' AND 2 ' ')
# 4. TAKE NEXT MOST OPTIMUM SQUARE (WHERE THERE IS 3 ' ')
# 5. TAKE RANDOM SQUARE


  # OPTION 1 OR 2 ATTACK OR DEFEND
  # COMPUTER WILL ATTACK IF IN WINNING POSITION OR DEFEND IF IN A LOSING POSITION
  def instinct(marker)
    Game::WINNING_LINES.any? do |the_line|
      if board.squares.values_at(*the_line).count(marker) == 2 && board.squares.values_at(*the_line).count(' ') == 1
        the_line.each {|e| (board.squares[e] == ' ') ? board.squares[e] = 'o' : e }
        board.draw_board
        break
      end
    end
  end

  # OPTION 3 
  def start_attack
    Game::WINNING_LINES.any? do |the_line|
      if board.squares.values_at(*the_line).count('o') == 1 && board.squares.values_at(*the_line).count(' ') == 2
        comp_choice = the_line.select {|e| board.squares[e] == ' ' }.sample
        @board.take_square(c3po , comp_choice)
        board.draw_board
        break
      end
    end
  end

  # OPTION 4
  def best_option
    options = Array.new(0)
    Game::WINNING_LINES.each do |the_line|
      if board.squares.values_at(*the_line).count('o') == 0 && board.squares.values_at(*the_line).count('x') == 0
        options << the_line.keep_if {|e| board.squares[e] == ' ' }
      end 
    end
    if options.any?
      comp_choice = options.flatten.uniq.sample
      @board.take_square(c3po , comp_choice)
      board.draw_board
    end
  end

  # OPTION 5
  def random_move
    comp_choice = board.squares.each_index.select{|index| board.squares[index] == ' '}.sample
    @board.take_square(c3po , comp_choice)
  end

  # MOVE CONTROLLER
  def computers_turn
    if @board.available_squares.any?
      if two_in_a_row?('o') == true
        instinct('o')
      elsif two_in_a_row?('x') == true
        instinct('x')
      elsif one_in_a_row?('o') == true
        start_attack
      elsif none_in_a_row?('o') == true
        best_option
      else
        random_move      
      end
    end
    check_for_winner('o', c3po.name)
  end

  # takes a marker and checks for 2 in a row with other square empty
  def two_in_a_row?(marker)
    Game::WINNING_LINES.each do |the_line|
      if board.squares.values_at(*the_line).count(marker) == 2 && board.squares.values_at(*the_line).count(' ') == 1
        return true
      end
    end
  end
  
  # takes a marker and checks if there is 1 marker and 2 empty squares
  def one_in_a_row?(marker)
    Game::WINNING_LINES.each do |the_line|
      if board.squares.values_at(*the_line).count(marker) == 1 && board.squares.values_at(*the_line).count(' ') == 2
        return true
      end
    end
  end

  # is it an empty row?
  def none_in_a_row?(marker)
    Game::WINNING_LINES.each do |the_line|
      if board.squares.values_at(*the_line).count(marker) == 0 && board.squares.values_at(*the_line).count(' ') == 3
        return true
      end
    end
  end

  # takes a marker and player name and checks if player has won
  def check_for_winner(marker, player)
    Game::WINNING_LINES.each do |the_line|
      if board.squares[the_line[0]] == marker && board.squares[the_line[1]] == marker && board.squares[the_line[2]] == marker
        puts "#{player} wins"
        sleep 0.5
        exit
      end
    end
    Game::WINNING_LINES.each do |the_line|
      if @board.available_squares.any? == false
        puts "It's a tie!"
        sleep 0.5
        exit
      end  
    end
  end

  def play
    @board.draw_board
    first_go = [human, c3po].sample
    puts "#{first_go.name} goes first"
    sleep 0.5
    while @board.available_squares.any?
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