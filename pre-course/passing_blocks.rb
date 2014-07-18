# passing_blocks.rb

def take_block(number, &the_test)
  the_test.call
end


[1,2,3,4,5].each do |number|
  take_block number do
    puts "Block being called in the method! #{number}"
  end
end