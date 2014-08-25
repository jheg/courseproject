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
      draw_board(squares)
    end
end
def player2(squares)
    puts "Computer chooses a square"
    sleep 0.5
    i = available_squares(squares).sample
    squares[i] = "o"
    draw_board(squares)
end

# setting the who goes first variable
goes_first = players.sample

# show players the empty board
draw_board(board_squares)

# Conditional that checks which loop to execute: player 1 or player 2
if goes_first == 'player1'
  begin
    player1(board_squares)
    player2(board_squares)
  end until available_squares(board_squares).empty?
elsif goes_first == 'player2'
  begin
    player2(board_squares)
    player1(board_squares)
  end until available_squares(board_squares).empty?
end

sleep 0.5
puts "GAME OVER"


# play again?
sleep 0.5
puts "Play again? (y/n)"
play_again = gets.chomp

end






   


