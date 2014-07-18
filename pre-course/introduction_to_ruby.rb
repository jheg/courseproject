# Introduction to Ruby - The book from the Tealeaf boot camp.

  # Indentation should be set to two spaces

# use_snake_case

  # Naming a file
  this_is_a_snake_cased_file.rb

  # Assigning a variable
  forty_two = 42

  # Defining a method
  def this_is_a_great_method
    # do stuff
  end

# Use UPPERCASE for constants

  # Constant declaration
  FOUR = 'four'
  FIVE = 5

# When working with do/end blocks, prefer {} when the entire expression fits onto one line

  # Multiline
  [1,2,3].each do |i|
    # do stuff
  end

  # Does the same thing on a single line
  [1,2,3].each { |i| # do stuff }

# When declaring classes use CamelCase

  class MyFirstClass
  end

  class MySecondClass
  end

# Strings

  # Example one double quotes
  "The man said, 'Hi there!'"

  # Example two single quotes and escaping 
  'The man said, \'Hi there!\''

  # SPECIAL NOTE REGRDING INTERPOLATION
    # Double quotes allow interpolation that allows you to merge Ruby code with Strings
    a = "ten"
    "My favorite number is #{a}!"

# SYMBOLS are created by placing (:) before a word

  # Examples of symbols 
  :name

  :a_symbol

  :"This is also a symbol!"

  # A symbol is used when you want to reference something without printing to screen or changing it.
  