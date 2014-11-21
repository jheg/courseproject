require ('pry')

module Takes_Passengers
  def can_carry_passengers
    "Your vehicle can take passengers" 
  end
end

class Vehicle
  attr_accessor :color, :make, :current_speed
  attr_reader :year

  @@number_of_vehicles = 0

  def initialize(y,c,m)
    @year = y
    @color = c
    @make = m
    @current_speed = 0 
    @@number_of_vehicles += 1
  end

  def self.vehicle_count
    @@number_of_vehicles
  end
  
  def self.mpg(miles_driven, litres_used)
    gallons = litres_used / 4.54609
    mpg = miles_driven / gallons
    "Your vehicle gets #{mpg.round(2)} miles per gallon."
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} spray paint looks wicked!"
  end

  def speed_up(mph)
    self.current_speed += mph
  end

  def slow_down(mph)
    self.current_speed -= mph
  end

  def stop
    self.current_speed = 0
  end

  def age
    "Your vehicle is #{calculates_age} years old."
  end

  private

  def calculates_age
    Time.now.year - self.year.to_i
  end
end

class MyTruck < Vehicle
  TYPE = "Truck"

  @@number_of_trucks = 0

  def initialize(y,c,m)
    super(y,c,m)
    @@number_of_trucks += 1
  end

  def self.truck_total
    @@number_of_trucks
  end

  def self.vehicle_type
    TYPE
  end

  def to_s
    "Your truck is a #{self.color}, #{self.year} #{self.make}."
  end  
end

class MyCar < Vehicle
  TYPE = "Car"

  include Takes_Passengers

  @@number_of_cars = 0

  def initialize(y,c,m)
    super(y,c,m)
    @@number_of_cars += 1
  end

  def self.car_total
    @@number_of_cars
  end

  def self.vehicle_type
    TYPE
  end

  def to_s
    "Your car is a #{self.color}, #{self.year} #{self.make}."
  end
end

jasons_car = MyCar.new("2010", "red", "Vauxhall Corsa")
puts MyCar.mpg(400, 48.78)
puts jasons_car
puts MyCar.vehicle_type
puts MyCar.car_total
puts MyCar.vehicle_type
puts MyTruck.truck_total
puts MyTruck.vehicle_type

puts "You current have #{Vehicle.vehicle_count} vehicles"

vics_car = MyCar.new("2000", "Ford Mondeo", "Black")
marks_truck = MyTruck.new("2014", "Skania", "White")

puts "You current have #{Vehicle.vehicle_count} vehicles"

puts jasons_car.can_carry_passengers

puts jasons_car.age


