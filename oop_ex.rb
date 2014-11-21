class Animal
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def speak
    "#{name} says Arf!"
  end
end

class GoodDog < Animal

  attr_accessor :name, :height, :weight

  def initialize(name, height, weight)
    super(name)
    @height = height
    @weight = weight
  end
  def change_info(n,h,w)
    self.name = n
    self.height = h
    self.weight = w
  end
  def speak
    super + "#{name} says Woof!"
  end
  def to_s
    "#{name} weighs #{weight} and is #{height} tall"
    end
end
class GoodCat < Animal
end


# sparky = GoodDog.new("Sparky", "2ft", "2st")
# fido = GoodDog.new("Fido", "3ft", "3st")

# puts sparky.speak
# puts sparky

# sparky.change_info("Jason", "6ft", "10st")
# puts sparky

# ex1

module VehicleActions
  def speed_up(n)
    @speed += n
    puts "You accelerate by #{n}mph and are now travelling at #{@speed}mph."
  end
  def slow_down(n)
    @speed -= n
    puts "You decelerate by #{n}mph and are now travelling at #{@speed}mph."
  end
  def stop
    puts "We've stopped!"
  end
  def spray_paint(c)
    self.colour = c
    puts "Woah! nice paint job you car looks so rad in #{c}"
  end
end

class Vehicle

  attr_accessor :model, :year, :colour

  @@total_vehicles = 0

  def initialize(m,y,c)
    @model = m
    @year = y
    @colour = c
    @@total_vehicles += 1
  end
  include VehicleActions

  def self.mpg(g,m)
    m / g
  end

  def self.to_s
    "The total number of vehicles in your yard is #{@@total_vehicles}."
  end

  def how_old
    "You vehicle is #{age} years old."
  end

  private

  def age
    Time.now.year - year
  end

end

class MyCar < Vehicle

  VEHICLE_TYPE = "car"
  @@total_cars = 0

  def initialize(m,y,c)
    super(m,y,c)
    @speed = 0
    @@total_cars += 1
  end

  def self.your_cars_total
    if @@total_cars < 2
      puts "You have #{@@total_cars} car in the garage"
    else
      puts "You have #{@@total_cars} cars in the garage" 
    end
  end

  def self.to_s
    "This class is a #{VEHICLE_TYPE}."
  end

  def to_s
    "Your car is a #{model} from the year #{year} and is #{colour}."
  end
end
class MyTruck < Vehicle

end

vehicle1 = MyCar.new("Ford Fiesta", 2014, "blue")
puts vehicle1
puts MyCar.your_cars_total
vehicle2 = MyCar.new("Ford Mondeo", 2000, "black")
puts vehicle1
puts MyCar.your_cars_total
puts MyCar
vehicle3 = MyTruck.new("Bedford", 1999, "white")
puts Vehicle

puts vehicle1.how_old
puts vehicle2.how_old
puts vehicle3.how_old
# vehicle1.speed_up(50)
# vehicle1.slow_down(30)
# vehicle1.stop
# puts vehicle1.colour
# vehicle1.colour = "red"
# puts vehicle1.colour
# puts vehicle1.year
# vehicle1.spray_paint('silver')

# MyCar.your_cars_total

# puts vehicle1
# p vehicle1
# puts MyCar.mpg(13, 351)