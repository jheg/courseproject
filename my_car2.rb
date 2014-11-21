module Drive
  def speed_up( num )
    self.speed += num
    puts "you accelerate by #{num} and are now travelling at #{speed} mph."
  end

  def slow_down( num ) 
    self.speed -= num
    puts "You decrease your speed by #{num} and are now travelling at #{speed}"
  end

  def stop
    puts "stop and park"
  end
end

module Floatable
  def floats
    puts "boats float!"
  end
end

module VehicleAge
  def age
    current_date = Time.new
    the_year = current_date.year
    num_of_years = the_year - self.year.to_i 
    puts "Your #{self.class::VEHICLE_TYPE} is #{num_of_years} old"
  end
end

class Vehicle
  
  attr_accessor :year, :colour, :model, :speed
  @@num_of_vehicles = 0

  def initialize(y,c,m)
    @year = y
    @colour = c
    @model = m
    @speed = 0
    @@num_of_vehicles += 1
  end

  def self.mpg( miles, gallon ) 
    puts "Your car gets #{miles / gallon}"
  end

  def self.number_of_vehicles
    @@num_of_vehicles
  end
  
  def change_vehicle( y,c,m )
    self.year = y
    self.colour = c
    self.model = m
  end

  include Drive
end

class MyCar < Vehicle
  VEHICLE_TYPE = "car"
  # @@num_of_cars = 0

  # def self.total_num_of_cars
  #   @@num_of_cars
  # end

  # def my_car_info
  #   puts "You drive a #{colour} #{year} #{model}. The vehicle type is #{VEHICLE_TYPE}"
  # end
  def to_s
    puts "#{model} #{VEHICLE_TYPE}s rock!"
  end

  include VehicleAge
end

class MyTruck < Vehicle
  VEHICLE_TYPE = "truck"

  def to_s  
    puts "#{model} #{VEHICLE_TYPE}s rock!"
  end
  include VehicleAge
end

class MyBoat < Vehicle
  include Floatable
  VEHICLE_TYPE = "boat"

  def to_s
    puts "#{model} #{VEHICLE_TYPE}s rock!"
  end
  include VehicleAge
  
end

car1 = MyCar.new( "2000", "black", "Ford Modeo" )
car2 = MyCar.new( "2000", "red", "Vauxhall Corsa" )
lorry1 = MyTruck.new( "1970", "blue", "Bedford" )
lorry2 = MyTruck.new( "2010", "black", "Skania" )
car3 = MyCar.new( "2001", "black", "VW Polo GTI" )
boat1 = MyBoat.new( "1987", "yellow", "Rubber dingy" )


puts Vehicle.number_of_vehicles
puts car1
puts car2
puts car3
puts lorry1
puts lorry2
puts boat1

boat1.floats

p MyCar.ancestors
p MyBoat.ancestors
p MyTruck.ancestors
puts car1

car1.age
car2.age
car3.age
boat1.age
lorry1.age
lorry2.age
