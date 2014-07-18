# excersizes from basics

# 1 Add two strings together that, when concatenated, return your first and last name as your full name in one string.

puts "Jason" + " " + "Hegarty"

# 2 Use the modulo operator, division, or a combination of both to take a 4 digit number and find 1) the thousands number 2) the hundreds 3) the tens and 4) and the ones.

puts 7435 / 1000
puts 7435 % 1000 / 100
puts 7435 % 1000 % 100 / 10
puts 7435 % 1000 % 100 % 10

# 3 Write a program that uses a hash to store a list of movie titles with the year they came out. Then use the puts command to make your program print out the year of each movie to the screen. The output for your program should look something like this.

movies = {:"Pulp Fiction" => 1990, :"Days of Thunder" => 1986, :"Wizard of Oz" => 1920}

puts movies[:"Pulp Fiction"]
puts movies[:"Days of Thunder"]
puts movies[:"Wizard of Oz"]

# 4 put the above dates into an array and print out the dates 

movie_dates = []

movies.each{|key, val| movie_dates << val}

puts movie_dates[0]
puts movie_dates[1]
puts movie_dates[2]

# 5 the factorial of 5, 6, 7 & 8

puts 5 * 4 * 3 * 2 * 1
puts 6 * 5 * 4 * 3 * 2 * 1
puts 7 * 6 * 5 * 4 * 3 * 2 * 1
puts 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1

# 6 the square of 3 floats output to screen

puts 5.0 * 5.0
puts 3.24 * 3.24
puts 10.6 * 10.6



