# Initialize board hash
# Draw board 
# Choose at random who goes first

# Player/Computer has a turn if square available
# check for winner

# play again?

require 'pry'

play_again = 'y'



# initialize the empty hash that will store the board squares
board_squares = {1 => " ",2 => " ",3 => " ",4 => " ",5 => " ",6 => " ",7 => " ",8 => " ",9 => " "}

# Available squares
def available_squares(h)
  h.select {|k,v| h[k] == " "}.keys
end

# players stored in array so player can be chosen at random
players = ["player1", "player2"]

# draw the board 
def draw_board(s)
  system 'clear'
  puts "#{s[1]}|#{s[2]}|#{s[3]}"
  puts "-----"
  puts "#{s[4]}|#{s[5]}|#{s[6]}"
  puts "-----"
  puts "#{s[7]}|#{s[8]}|#{s[9]}"
end


# show players the empty board
draw_board(board_squares)
# player/computer picks square methods

def player1(g)
    puts "Choose an available square #{available_squares(g)}"
    i = gets.chomp.to_i
    
      if available_squares(g).include?(i)
        g[i] = "x"
      else
        player1(g)
      end 
     
    draw_board(g)
end

def player2(g)
    puts "Computer chooses a square"
    sleep 1
    i = available_squares(g).sample
    g[i] = "o"
    draw_board(g)
end

begin
  player1(board_squares)
  player2(board_squares)
end until available_squares(board_squares).empty?

puts "GAME OVER"
puts "Play again? (y/n)"
play_again = gets.chomp

# Run conditional to decide which method to invoke - player or computer
# def goes_first(a)
#   first = a.sample
#   return first
# end

# no_one = goes_first(players)

# if no_one == "player"
#   puts "You go first!"
#   player(board_squares)
# elsif no_one == "computer"
#   puts "Wait your turn..."
#   computer(board_squares)
# end


# play again?
# until play_again == "y" || play_again == "n"
#   puts "Play again? (type y or n)"
#   play_again = gets.chomp
# end


   


