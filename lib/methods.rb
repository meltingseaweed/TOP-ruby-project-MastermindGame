#This will contain a few methods for now
module Mastermind
  
  module MethodsToRun
    @@colors = ["r", "y", "b", "g", "m", "c"]
    def generate_computer_input
      colors = @@colors
      3.times do 
        colors += colors
      end
      colors.sample(4)

    end

    def check_color(secret_code, color)
      # binding.pry
      colors_found = []
      red_pins = 0
      secret_code.each do |secret|
        if secret == color
          colors_found << color
          # Will it alter the value in the computer_guess section?
          red_pins += 1
        end
      end
      colors_found
    end

  end

end