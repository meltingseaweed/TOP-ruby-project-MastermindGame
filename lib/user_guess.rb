#This creates the object which pulls the different methods
module Mastermind

  class UserGuess

    include Compare
    include Methods
    
    def initialize
      @turns = Array.new(12) { Array.new(6) }
      @pin_display = Array.new(12) { Array.new(2) }
      @round_count = 0
      @secret_code = generate_computer_input # Or does it need self.generate_computer_input?
      @white_pins = 0
      @red_pins = 0
      @user_guess = ""
    end

    def play_game
      while @round_count < 12
        computer = @secret_code.dup
        @user_guess = show_colors # Or does it need self.show_colors?
        @turns[@round_count] = @user_guess
      
        if all_match(@secret_code, @user_guess) == true
          puts "Congratulations, #{@user_guess} is correct!!"
          puts "You win!!"
          break
        end

        @white_pins = 0
        @red_pins = 0

        @red_pins = exact_match(computer, @user_guess)
        puts "#{@red_pins} red pins".colorize(:red)
        @white_pins = near_matches(computer, @user_guess)
        puts "#{@white_pins} white pins".colorize(:white)
        @pin_display[@round_count] = ["#{@red_pins}red", "#{@white_pins}white"]

        puts "The board now shows:"
        @turns.each_with_index do |row, row_index|
          if (row_index <= @round_count)
            puts "#{row} #{@pin_display[row_index]}"
          end
        end

        @round_count += 1

      end

      if @round_count > 11 then puts "Nice try. The secret code was #{@secret_code}"
      end
    end
  end
end