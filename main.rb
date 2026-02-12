# Main file
#require files/folders and gems, inc. colorize
require 'pry-byebug'
require 'colorize'
require_relative 'lib/compare'
require_relative 'lib/methods'
require_relative 'lib/computer_guess'
require_relative 'lib/game'

game = Mastermind::Game.new("game")
game.check_all_colors
game.reorder_colors
puts "Did the computer guess correct?"
binding.pry
#Computer generates code, an array of strings of the available colors.
# Run method to generate the random color array.
secret_code = game.generate_computer_input
turns = Array.new(12) { Array.new(6) }
pin_display = Array.new(12) { Array.new(2) }
# Maximum round count is 12. Start round count at 1
round_count = 0
while round_count < 12
  computer = secret_code.dup 

  user_guess = game.show_colors
  user_guess = user_guess.split("")
  turns[round_count] = user_guess
  
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
  puts "#{red_pins} red pins".colorize(:red)
  white_pins = game.near_matches(computer, user_guess)
  puts "#{white_pins} white pins".colorize(:white)
  pin_display[round_count] = ["#{red_pins}red", "#{white_pins}white"]
  # Think how to place the number of pins beside 
  # each guess.
  puts "The board now shows:"
  turns.each_with_index do |row, row_index|
    if (row_index <= round_count)
       puts "#{row} #{pin_display[row_index]}"
    end
  end

  round_count += 1

end
if round_count > 11 then puts "Nice try. The secret code was #{secret_code}"
end

