# method that capitalizes a word if it has more than 10 chars



def upper(word)
  if word.length < 11
    word
  else
    word.capitalize
  end
end

puts "enter a word"
puts upper(gets.chomp)


def up_case(word)
  if word.length >= 10
    puts word.capitalize
  else
    puts word
  end
end

puts "enter a word"
up_case(gets.chomp)

