# Initialize board hash
# Draw board 
# Choose at random who goes first

# Player/Computer has a turn if square available
# check for winner

require 'pry'

# play again?
play_again = 'y'

while play_again == 'y'

# initialize the empty hash that will store the board squares
board_squares = {1 => " ",2 => " ",3 => " ",4 => " ",5 => " ",6 => " ",7 => " ",8 => " ",9 => " "}

# rows columns and diagonals
lines = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

# Available squares
def available_squares(squares)
  squares.select {|_,v| v == " "}.keys
end

# players stored in array so player can be chosen at random
players = ["player1", "player2"]

# draw the board 
def draw_board(squares)
  system 'clear'
  puts "#{squares[1]}|#{squares[2]}|#{squares[3]}"
  puts "-----"
  puts "#{squares[4]}|#{squares[5]}|#{squares[6]}"
  puts "-----"
  puts "#{squares[7]}|#{squares[8]}|#{squares[9]}"
end

# check for winner method
def check_for_winner(line, squares)
  if line.find {|l| l.all? {|k| squares[k] == "x"} }
    puts "player WINS!!!"
    return true
  elsif line.find {|l| l.all? {|k| squares[k] == "o"} }
    puts "computer wins :("
    return true
  end
end

def defend_or_attack(lines, board)
  # computer needs to defend possible win conditions
  lines.any? do |line|
    i = two_in_a_row?(lines, board)
    if i
      board[i] = 'o'
    else
      board[available_squares(board).sample] = 'o'
    end
  end
end

def two_in_a_row?(lines, hsh)
    arr = lines.find_index {|l| l.any? {|k| hsh[k] == ' '} }
    line = lines[arr]
    binding.pry
    if hsh[i].values.count('x') == 2
      return hsh.select{|k,v| v == ' '}.keys.first
      binding.pry
    else
      return false
    end
end

# player/computer picks square methods
def player1(squares) 
    if available_squares(squares).any?
      puts "Choose an available square from #{available_squares(squares)}"
      i = gets.chomp.to_i    
        if available_squares(squares).include?(i)
          squares[i] = "x"
        else
          player1(squares)
        end     
    end
end


def player2(line, squares)
    puts "Computer chooses a square"
    sleep 0.5

# if player has two positions in a line and the other is empty defend else attack < not yet implemented

    defend_or_attack(line, squares)
end

# setting the who goes first variable
goes_first = players.sample

# show players the empty board
draw_board(board_squares)

# Conditional that checks which loop to execute: player 1 or player 2
if goes_first == 'player1'
  begin
    break if check_for_winner(lines, board_squares) == true
    player1(board_squares)
    draw_board(board_squares)
    break if check_for_winner(lines, board_squares) == true
    player2(lines, board_squares)
    draw_board(board_squares)    
  end until available_squares(board_squares).empty?
elsif goes_first == 'player2'
  begin
    break if check_for_winner(lines, board_squares) == true
    player2(lines, board_squares)
    draw_board(board_squares)
    break if check_for_winner(lines, board_squares) == true
    player1(board_squares)
    draw_board(board_squares)
  end until available_squares(board_squares).empty?
end

sleep 0.5
puts "GAME OVER"


# play again?
sleep 0.5
puts "Play again? (y/n)"
play_again = gets.chomp

end






   


