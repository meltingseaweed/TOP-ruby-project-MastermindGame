#This will contain a few methods for now
module Mastermind
  
  module Methods
    COLORBASE = ["r", "y", "b", "g", "m", "c"]

    def generate_computer_input
      colors = COLORBASE
      3.times do 
        colors += colors
      end
      colors.sample(4)
    end

    def show_colors
      print "b = blue / ".colorize(:blue)
      print "r = red / ".colorize(:red)
      print "g = green / ".colorize(:green)
      print "y = yellow / ".colorize(:yellow)
      print "m = magenta / ".colorize(:magenta)
      print "c = cyan ".colorize(:cyan)
      puts ""
      input = gets.chomp
      input = input.split("")
      input
    end

    def check_color(secret_code, color)
      # binding.pry
      colors_found = []
      red_pins = 0
      secret_code.each do |secret|
        if secret == color
          colors_found << color
          red_pins += 1
        end
      end
      colors_found
    end
  end
end