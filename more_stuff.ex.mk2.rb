# 1

def checks_in(string)
  if /lab/ =~ string
    puts "we have a match!"
  else
    puts "'lab' does not exist in #{string}"
  end
end

checks_in("laboratory")
checks_in("experiment")
checks_in("Pans Labyrinth")
checks_in("elaborate")
checks_in("polar bear")

# passing-block

def take_block(number, &block)
  block.call
end

[1,2,3,4,5].each do |number|
  take_block number do
    puts "Block being called in the method #{number}"
  end
end

# exception handling

names = ["Jay", "Vic", "Chaz", nil, "Annie"]

names.each do |name|
  begin
    puts "#{name}'s name has #{name.length} letters in it."
  rescue
    puts "Oops something went wrong"
  end
end

# 2

def execute(&block)
  block
end

execute{ puts "Hello from inside the execute block!" }
# Nothing is printed out (call wasn't called) and a Proc is returned. 

# 4
def execute(&block)
  block.call
end

execute{ puts "Hello from inside the execute block!" }



