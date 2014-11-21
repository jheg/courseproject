# 1. Have detailed requirements or specifications in written form.
# 2. Extract major nouns -> classes
# 3. Extract major verbs -> instance methods
# 4. Group instance methods into classes


class Players
  attr_accessor :name
  def initialize(n)
    @name = n
  end

  def to_s
    "#{name} has ..."
  end
end

class Deck
  attr_accessor :deck

  def initialize
    @deck = []
    ['H', 'S', 'C', 'D'].each do |suit|
      ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |value|
        @deck << Card.new(value, suit)
      end
    end
    shuffle_cards
  end

  def shuffle_cards
    deck.shuffle!
  end

  def deal
    deck.pop
  end
end

class Card
  attr_accessor :value, :suit

  def initialize(v,s)
    @value = v
    @suit = s
  end

  def to_s
    "#{value}, #{suit}"
  end
end

class Player < Players

end

class Dealer < Players

end


cards = Deck.new

jason = Player.new('Jason')
puts jason





