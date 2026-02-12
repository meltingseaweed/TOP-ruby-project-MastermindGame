#This creates the object which pulls the different methods
module Mastermind
  class Game

    include Compare
    include MethodsToRun
    include ComputerGuess
    
    def initialize(name)
      @name = name
    end

    def show_colors
    print "b = blue / ".colorize(:blue)
    print "r = red / ".colorize(:red)
    print "g = green / ".colorize(:green)
    print "y = yellow / ".colorize(:yellow)
    print "m = magenta / ".colorize(:magenta)
    print "c = cyan ".colorize(:cyan)
    puts ""
    user_guess = gets.chomp
    user_guess = user_guess.split("")
    user_guess
    end
    
  end
end