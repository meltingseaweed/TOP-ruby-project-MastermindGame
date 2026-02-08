# Main file
# 
#require files/folders and gems, inc. colorize
require 'pry-byebug'
require 'colorize'
require_relative 'lib/compare'
require_relative 'lib/methods'
require_relative 'lib/mastermind'

# 1st build system so that computer generates secret code and human
# guesses

# Mastermind colors:
# red, blue, green, yellow, orange, purple.
# Each color represented by a string in the array.

game = Mastermind.new("game")
#Computer generates code, an array of strings of the available colors.
# Run method to generate the random color array.
secret_code = game.generate_computer_input

# Maximum round count is 12. Start round count at 1
round_count = 1
while round_count < 13
  computer = secret_code.dup 
# Take an input from the user. Letter inputs are fine.
  puts "Guess the secret code."
  puts "Enter 6 letters, no spaces, no commas in the order you think:"
  print "b = blue / ".colorize(:blue)
  print "r = red / ".colorize(:red)
  print "g = green / ".colorize(:green)
  print "y = yellow / ".colorize(:yellow)
  print "m = magenta / ".colorize(:magenta)
  print "c = cyan ".colorize(:cyan)
  puts ""
  user_guess = gets.chomp
  user_guess = user_guess.split("")
  binding.pry
  # Compare the two arrays
  if game.all_match(secret_code, user_guess) == true
    puts "Congratulations, that is correct!!"
    puts "You win!!"
    break
  end

  white_pins = 0
  red_pins = 0

  red_pins = game.exact_match(computer, user_guess)
  puts "The number of red pins is #{red_pins}"
  white_pins = game.near_matches(computer, user_guess)
  puts "The number of white pins is #{white_pins}"

  round_count += 1

end
if round_count > 12 then puts "Nice try. Would you like to try again?"
end