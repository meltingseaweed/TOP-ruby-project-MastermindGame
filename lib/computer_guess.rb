# Below is the code if the human makes the secret and the computer
# guesses the secret code
module Mastermind
  
  class ComputerGuess
    include Mastermind::Methods
    include Mastermind::Compare

    COLORS = [%w(r r r r), %w(b b b b), %w(g g g g), %w(y y y y), %w(c c c c), %w(m m m m)]
    
    def initialize
      puts "Please input your secret code of 4 colors:"
      @secret_code = show_colors
      @turns = Array.new(12) { Array.new(6) }
      @pin_display = Array.new(12) { Array.new(2) }
      @included_colors = []
      @color_shuffle = []
      @incorrect_idx = []
      @round_count = 0
      @solved = false
      @red_pins = 0
    end

    def play_game
      puts "The computer will now guess your secret code:"

      for i in 0..5 do 
        if @secret_code == COLORS[i]
          puts "Lucky computer guessed it correct, the code is #{@secret_code}"
        else 
          @red_pins = exact_match(@secret_code, COLORS[i])
          @included_colors << check_color(@secret_code, COLORS[i][0])
          @turns[i] = COLORS[i]
          # Think about how to manage and display the red and white pins
          # for the computer guesses
          @pin_display[i] = [@red_pins, 0]
          puts "The board now shows:"
        @turns.each_with_index do |row, row_index|
          if (row_index <= i)
            puts "#{row} #{@pin_display[row_index]}"
          end
        end
        end
        @round_count += 1
      end
      @included_colors.flatten!

      while @solved != true

        if @included_colors == @secret_code
          @solved = true
          break
        elsif @round_count > 12
          puts "The computer could not guess the correct answer."
          puts "It's last guess was #{@included_colors}."
          break
        end
      @incorrect_idx = []
      @color_shuffle = []
      @included_colors.each_with_index do |color, idx|
        if color != @secret_code[idx]
          @incorrect_idx << idx
          @color_shuffle << color
        end
      end

      @color_shuffle.shuffle!

      position = 0
      @incorrect_idx.each do |i|
        @included_colors[i] = @color_shuffle[position]
        position += 1
       end
      @round_count += 1
      end

    p "The final answer was found to be #{@included_colors}"
    end
  end
end