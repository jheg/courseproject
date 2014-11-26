require 'pry'
# 1. Have detailed requirements or specifications in written form.
# 2. Extract major nouns -> classes
# 3. Extract major verbs -> instance methods
# 4. Group instance methods into classes


class Deck
  attr_accessor :deck 

  FACES = [2,3,4,5,6,7,8,9,10,'J','Q','K','A']
  SUITS = %w{H D S C}

  def initialize
    @deck = []
    SUITS.each do |suit|
      FACES.each do |value|
        @deck << Card.new(value, suit)
      end
    end
    shuffle!
  end

  def shuffle!
    @deck.shuffle!
  end

  def deal_card
    @deck.pop
  end
end

class Card
  attr_reader :face, :suit, :value

  def initialize(face, suit)
    @face = face
    @suit = suit
    @value = card_value
  end

  def card_value
    if (2..10).include?(face)
      face
    elsif face == 'A'
      11
    else
      10
    end  
  end
end

class Player
  attr_reader :name
  attr_accessor :hand, :hand_value, :hand_value2

  def initialize(name)
    @name = name
    @hand = []
    @hand_value = 0
    @hand_value2 = 0
  end

  def cards
    @hand.map { |card| "#{card.face} of #{card.suit}" }
  end

  def calculate_total
    @hand_value = 0
    @hand_value2 = 0
    @hand.each{|card| @hand_value = @hand_value + card.value}
    @hand.each{|card| @hand_value2 = @hand_value2 + card.value}
    @hand.map{|card| card.face == 'A' ? @hand_value2 = @hand_value - 10 : @hand_value }
    if @hand_value > 21
      @hand_value2
    else
      @hand_value
    end
  end

  def to_s
    @name
  end
end


class Game
  attr_accessor :players, :dealer, :game_deck
  attr_reader :deck1, :deck2

  GREETINGS = ["Hey", "Hi", "hullo there", "Nice to see you", "Greetings", "o/", "Good luck", "Prepare to lose"]

  def initialize
    @deck1 = Deck.new
    @deck2 = Deck.new
    @game_deck = deck1.deck.concat(deck2.deck)
    @players = []
    @dealer = Player.new('Frank')
  end

  def greet(player)
    system 'clear'
    puts "-----------------------------"
    puts "#{GREETINGS.sample} #{player}"
    puts "-----------------------------"
    sleep 0.5
  end

  def deal_cards
    2.times do
      players.each do |player| 
        player.hand << @game_deck.pop
      end
      @dealer.hand << @game_deck.pop
    end
  end

  # displays cards and total
  def display_cards(current_player, total)
    current_player.hand.each do |card|
      if card.face == 10 
        puts " ---"
        puts "|#{card.face} |"
        puts "|   |"
        puts "|  #{card.suit}|"
        puts " ---"
      else
        puts " ---"
        puts "|#{card.face}  |"
        puts "|   |"
        puts "|  #{card.suit}|"
        puts " ---"        
      end
      sleep 0.5
    end 
    puts "Hand total is #{total}"
  end

  def dealer_show_first_card(dealer)
    if dealer.hand[0].face == 10 
      puts " ---   ---" 
      puts "|#{dealer.hand[0].face} | |   |"
      puts "|   | |   |"
      puts "|  #{dealer.hand[0].suit}| |   |"
      puts " ---   ---"
    else
      puts " ---   ---"
      puts "|#{dealer.hand[0].face}  | |   |"
      puts "|   | |   |"
      puts "|  #{dealer.hand[0].suit}| |   |"
      puts " ---   ---"        
    end
  end

  def turn(current_player, total, human_totals)
    system 'clear'
    puts "Dealer:"
    dealer_show_first_card(dealer)
    puts "Current player: #{current_player.name}"
    display_cards(current_player, total)
    if total == 21
      puts "BLACKJACK!"
      human_totals << total
    elsif total > 21
      puts "BUST. You lose"
      human_totals << total
    elsif total < 21
      begin         
        puts "hit?(h) or stay?(s)"
        answer = gets.chomp
      end until answer == 'h' || answer == 's'
      if answer == 'h'
        puts 'You hit'
        current_player.hand << @game_deck.pop
        total = current_player.calculate_total
        turn(current_player, total, human_totals)
      else
        puts "You choose to stay"
        human_totals << total
      end
    end
  end

  def dealers_turn(dealer, total, human_totals)
    system 'clear'
    # if all elemtns in human_totals > 21 dealer need not play hand and wins and exits - if more than 1 element in array everyone busted else you busted 
    if human_totals.all?{|total| total > 21} && human_totals.size == 1
      puts "You bust I don't need to show my cards. Dealer wins!"
      sleep 1
      exit
    elsif human_totals.all?{|total| total > 21} && human_totals.size > 1
      puts "You all bust? I win all the monies without even needing to play!"
      sleep 1
      exit
    end
    puts "Current player: #{dealer.name}(dealer)"
    display_cards(dealer, total)
    sleep 1
    if total == 21
      puts "BLACKJACK!"
    elsif total > 21
      puts "Dealer BUST"
    elsif total < 17
      puts "Dealer hits"
      dealer.hand << @game_deck.pop
      total = dealer.calculate_total
      dealers_turn(dealer,total, human_totals)
    elsif total > 17 
      puts "Dealer stays"
    end
  end

  def compare(player_name, players_total, dealers_total)
    if players_total > 21
      puts "#{player_name} bust. Dealer wins."
    elsif players_total == dealers_total
      puts "#{player_name} has #{players_total} and dealer has #{dealers_total} it's a tie!"
    elsif players_total > dealers_total
      puts "#{player_name} beats dealer with total of #{players_total}"
    elsif dealers_total > 21
      puts "Dealer bust. #{player_name} wins."
    else
      puts "Dealers #{dealers_total} beats #{player_name}'s #{players_total}"
    end
    sleep 1
  end

  def play
    human_totals = []
    system 'clear'
    puts "Welcome to the blackjack table"
    puts "How many human players?"
    num = gets.chomp.to_i

    # collect players
    @players = (1..num).map do |player|
      puts "Player#{player}: What is your name?"
      name = gets.chomp
      Player.new(name)
    end
    
    # greet players
    system 'clear'
    players.each{ |player| greet(player) }
    puts "I am the dealer. My name's #{dealer.name}"
    puts "Lets play!"

    # Deal initial cards
    deal_cards

    players.each do |current_player|
      system 'clear'
      total = current_player.calculate_total
      puts "#{current_player.name} you're up!"
      sleep 1
      turn(current_player, total, human_totals)
      puts "Press Enter to continue to next player ..."
      begin
        answer = gets
      end until !answer.empty?
    end
    system 'clear'
    puts "Dealers turn"
    puts "#{@dealer.name}(dealer) has #{@dealer.calculate_total}"
    dealers_turn(@dealer, @dealer.calculate_total, human_totals)
    puts "The game is over and the results are:"
    players.each{|player| compare(player.name, player.calculate_total, @dealer.calculate_total) }
  end
end

game = Game.new
game.play






