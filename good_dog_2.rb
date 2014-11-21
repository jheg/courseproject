# class GoodDog
#   attr_accessor :name, :weight, :height

#   def initialize( n, w, h )
#     @name = n
#     @weight = w
#     @height = h
#   end

#   def speak
#     "#{name} says bark!"
#   end

#   def change_info(n,w,h)
#     self.name = n
#     self.weight = w
#     self.height = h
#   end

#   def info
#     puts "#{name} weighs #{weight} and is #{height} tall"
#   end
# end

# lady = GoodDog.new( "Lady", "3st", "2ft" )
# puts lady.speak
# lady.info
# lady.change_info( "Rusty", "3.5st", "3ft" )
# lady.info

require ('pry')

class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w, id)
    @name = n
    @height = h
    @weight = w
    @dog_id = id
  end

  def speak
    "#{name} says Arrf!"
  end

  def change_info(n,h,w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} is #{self.height} and weighs #{self.weight}"
  end

  def id
    "xxxxxx" + @dog_id[-3,3]
  end
end

sparky = GoodDog.new("Sparky", "2.1ft", "3.5st", "301176-jlh")
puts sparky.speak
puts sparky.info


puts sparky.name
sparky.name = "Sparks"
puts sparky.name
puts sparky.id
sparky.change_info("Sparky", "2ft", "3st")
puts sparky.info


