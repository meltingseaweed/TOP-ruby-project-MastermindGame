# Main file
#require files/folders and gems, inc. colorize
require 'pry-byebug'
require 'colorize'
require_relative 'lib/compare'
require_relative 'lib/methods'
require_relative 'lib/computer_guess'
require_relative 'lib/user_guess'

puts "Would you like to make the secret code"
puts "or would you like the computer to make it?"
puts "Please type 'computer' or 'me'"
game_type = gets.chomp

if game_type == 'computer'
  game_one = Mastermind::ComputerGuess.new
  game_one.play_game
  puts "did it work?"
elsif game_type == 'me'
  game_two = Mastermind::UserGuess.new
  game_two.play_game
  puts "did it work?"
end