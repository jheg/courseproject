class Choice
  include Comparable
 
  def initialize name
    @name = name
  end
 
  def beats= choice
    @beats = choice
  end
 
  def <=> other
    return 0 if other == self
    other == @beats ? 1 : -1
  end
 
  def to_s
    @name
  end
 
  CHOICES = {
    'p' => new('Paper'),
    'r' => new('Rock'),
    's' => new('Scissors')
  }.freeze
 
  CHOICES['p'].beats = CHOICES['r']
  CHOICES['r'].beats = CHOICES['s']
  CHOICES['s'].beats = CHOICES['p']
end
 
class Player
  attr_accessor :name
 
  def initialize name
    @name = name
    @games_played = 0
    @games_won = 0
    @games_lost = 0
  end
 
  def loose
    @games_played += 1
    @games_lost += 1
  end
 
  def win
    @games_played += 1
    @games_won += 1
  end
 
  def tie
    @games_played += 1
  end
 
  def to_s
    "#{name} (#{@games_won} wins, #{@games_lost} looses, #{ties} ties)"
  end
 
  private
 
  def ties
    @games_played-@games_won-@games_lost
  end
end
 
class Human < Player
  def choice
    print "Choose (P)aper, (R)ock or (S)cissors: "
    pick = gets.chomp.downcase
    Choice::CHOICES.has_key?(pick) ? Choice::CHOICES[pick] : choice
  end
 
  def pick_name
    print "Enter your name: "
    self.name = gets.chomp
  end
end
 
 
class AI < Player
  def choice
    Choice::CHOICES.values.sample
  end
end
 
OPPONENTS = %w(Frank Tony Dudley).map {|name| AI.new name }
PLAYER = Human.new 'Human'
 
loop do
  puts 'Welcome to Paper, Rock, Scissors'
  PLAYER.pick_name
  opponent = OPPONENTS.sample
  puts "#{opponent} is your opponent for this game."
  player_choice = PLAYER.choice
  opponent_choice = opponent.choice
 
  puts "You picked #{player_choice}."
  puts "#{opponent.name} picked #{opponent_choice}."
 
  if player_choice == opponent_choice
    puts "Draw."
    PLAYER.tie
    opponent.tie
  elsif player_choice > opponent_choice
    puts "You win."
    PLAYER.win
    opponent.loose
  elsif opponent_choice > player_choice
    puts "#{opponent.name} wins."
    PLAYER.loose
    opponent.win
  end
 
  print "Do you want to play again? [Yn]: "
  break if gets.chomp.downcase == 'n'
end

# at game start create 3 opponents and just 1 opponent class needed. select from array and use instance vars to store history.

# jheg: I’m trying to increment one of three class variables depending on a conditional after the class instance has been created but struggling to figure out how
# [10:49pm] jheg: so I have three classes Op1, Op2 & Op3 …
# [10:49pm] jheg: actually i paste it
# [10:49pm] jheg: https://gist.github.com/jheg/944720d364dc1648f260
# [10:50pm] entrenador joined the chat room.
# [10:50pm] jheg: If anyone could have a little peak and see if there is anythign Im doing wrong I’d really appreciate it
# [10:50pm] entrenador left the chat room. (Client Quit)
# [10:50pm] jheg: ive created some class varaibles in the 3 classes starting on lines 52, 65 & 78
# [10:51pm] jheg: they are basically computer opponents
# [10:51pm] entrenador joined the chat room.
# [10:51pm] shevy: class variables are awful
# [10:51pm] jheg: initially they are set all to zero and store wins, losses and ties
# [10:51pm] jbueza left the chat room. (Quit: My MacBook Pro has gone to sleep. ZZZzzz…)
# [10:52pm] dkb20k joined the chat room.
# [10:52pm] o0oo0o left the chat room. (Ping timeout: 246 seconds)
# [10:52pm] jheg: each game loop the game recreates a new instance of one of the three classes so I dont think I can use instance vars as they get reset at instantiation
# [10:53pm] JBreit left the chat room. ("Leaving")
# [10:53pm] jheg: so i was trying update the class vars once the game has finished using the method i wrote on line 44 which i include in each class
# [10:53pm] jheg: shevy: why’d you say that?
# [10:53pm] shevy: because they really are
# [10:53pm] shevy: why do you need them there rather than @ivars?
# [10:55pm] entrenador left the chat room. (Client Quit)
# [10:55pm] jheg: because the game is on a loop and each loop instantiates one of the three available opponent classes and when they are initialized the @vars would be set to 0
# [10:55pm] deepy left the chat room. (Ping timeout: 272 seconds)
# [10:55pm] jheg: I need them to store a history
# [10:55pm] jheg: for example “you are playing Frank who has won 4, drawn 2 and lost 0”
# [10:55pm] jhass: jheg: you want to separate the history data from the game data
# [10:56pm] nacho-chips left the chat room. (Remote host closed the connection)
# [10:56pm] shevy: btw
# [10:56pm] shevy: def msg
# [10:56pm] shevy: puts "#{name} chooses #{option}"
# [10:56pm] shevy: where from does name come?
# [10:56pm] diegoviola: what's the alternative to chruby and ruby-install for python
# [10:56pm] deepy joined the chat room.
# [10:56pm] jheg: shevy: that comes from the class Player
# [10:56pm] nacho-chips joined the chat room.
# [10:57pm] deepy is now known as Guest12305.
# [10:57pm] dkb20k left the chat room. (Ping timeout: 256 seconds)
# [10:57pm] shevy: no that is not true
# [10:57pm] jheg: jhass: so store the history seperate from the opponent object?
# [10:57pm] jheg: orly?
# [10:57pm] shevy:   class Player; @@num = 0; attr_accessor :option; def initialize(option); @option = option; @@num += 0.5; end; def msg; puts "#{name} chooses #{option}"; end; def self.info; puts "Games = #{@@num.to_i}"; end; end
# [10:58pm] jheg: oh no sorry shevy it comes from the human class
# [10:58pm] shevy: yeah
# [10:58pm] snath left the chat room. (Ping timeout: 244 seconds)
# [10:58pm] shevy: I've never seen such before
# [10:58pm] havenwood: diegoviola: virtualenv
# [10:58pm] kinesis left the chat room.
# [10:58pm] jheg: It was in the Player class but I switched it to the Human and the Opponent classes
# [10:59pm] sinkensabe joined the chat room.
# [10:59pm] jhass: jheg: yes, class variables are shared among the ancestry chain, which is what's tricking you
# [10:59pm] jenrzzz left the chat room. (Ping timeout: 255 seconds)
# [10:59pm] kirun left the chat room. (Quit: Client exiting)
# [11:00pm] diegoviola: havenwood: thanks
# [11:00pm] jheg: jhass: It certainly is tricking me
# [11:01pm] havenwood: diegoviola: crush the snake! ruby, ruby, ruby!
# [11:02pm] jhass: jheg: instance variables are just a lot easier to reason about
# [11:02pm] diegoviola: havenwood: 
# [11:02pm] diegoviola: havenwood: yeah I was just being curious, I prefer ruby myself
# [11:03pm] jhass: jheg: I guess in your example one could also use class level instance variables (instance variables of the Class instance), but it's not a too nice design IMO
# [11:03pm] poulet_a joined the chat room.
# [11:03pm] havenwood: diegoviola: yeah, i poke around from time to time too
# [11:03pm] poulet_a left the chat room. (Client Quit)
# [11:03pm] diegoviola:
# [11:04pm] sinkensabe left the chat room. (Ping timeout: 264 seconds)
# [11:04pm] Xeago left the chat room. (Remote host closed the connection)
# [11:04pm] jenrzzz joined the chat room.
# [11:04pm] jheg: when I instantiate the class it sets the 3 vars to 0 if I put them in the initialize method so should I place them elsewhere in the class?
# [11:05pm] jheg: I mean I can’t increment them at creation as the result is not known until the end of the game
# [11:05pm] jhass: >> class Foo; @foo = :class; def initialize; @foo = :instance; end; def self.foo; @foo; end; def foo; @foo; end; end; [Foo.foo, Foo.new.foo]
# [11:05pm] eval-in__: jhass => [:class, :instance] (https://eval.in/216040)
# [11:05pm] jhass: two different variables
# [11:06pm] Devr3d left the chat room. (Remote host closed the connection)
# [11:07pm] jhass: you would extend not include your OpponentsTally and pass it the current instance to get the values
# [11:07pm] Xeago joined the chat room.
# [11:08pm] jhass: but do you plan to have any other per game data beyond the name?
# [11:08pm] Xiti joined the chat room.
# [11:09pm] jenrzzz left the chat room. (Ping timeout: 255 seconds)
# [11:09pm] jheg: no just the name and history data
# [11:09pm] djbkd left the chat room. (Remote host closed the connection)
# [11:09pm] jhass: and the name for the opponents is static, so I don't see why you need new instances each loop
# [11:10pm] djbkd joined the chat room.
# [11:10pm] phutchins joined the chat room.
# [11:10pm] jhass: just create them at boot and pick one in each cycle
# [11:10pm] jheg: ah yes great idea
# [11:10pm] jheg: so create all three and then select them from an array when the game starts?
# [11:11pm] jhass: yeah. for the player you currently collect no history data, if you plan to I'd keep it simple, make one instance and set the name again if desired
# [11:12pm] jheg: brilliant thanks mate - it seems so bloody obvious no you’ve said that too
# [11:12pm] jheg: *now you’ve said ...