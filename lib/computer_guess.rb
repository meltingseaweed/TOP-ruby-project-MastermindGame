# Below is the code if the human makes the secret and the computer
# guesses the secret code
module Mastermind
  
  module ComputerGuess


    COLORS = [%w(r r r r), %w(b b b b), %w(g g g g), %w(y y y y), %w(c c c c), %w(m m m m)]
    
    def check_all_colors
      puts "Please input your secret code of 4 colors:"
      secret_code = show_colors
      puts "The computer will now guess your secret code:"
      turns = Array.new(12) { Array.new(6) }
      pin_display = Array.new(12) { Array.new(2) }
      included_colors = []

      for i in 0..5 do 
        if secret_code == COLORS[i]
          puts "Lucky computer guessed it correct, the code is #{secret_code}"
        else 
          red_pins = exact_match(secret_code, COLORS[i])
          included_colors << check_color(secret_code, COLORS[i][0])
          turns[i] = COLORS[i]
          # Think about how to manage and display the red and white pins
          # for the computer guesses
          pin_display[i] = [red_pins, 0]
          puts "The board now shows:"
        turns.each_with_index do |row, row_index|
          if (row_index <= i)
            puts "#{row} #{pin_display[row_index]}"
          end
        end
        end

      end
      # NOTE the included colors already contain the correct number of
      # each color. So instead of this current style, it might be
      # better to try and find out how to switch the colors ONLY
      # of the incorrect indexs. 
      included_colors.flatten!
      round_count = 6
        binding.pry
      solved = false
      count = 0
      color_range = included_colors.uniq
      while solved != true

        if included_colors == secret_code
          solved = true
        end
      incorrect_idx = []
      # color_shuffle = []
      included_colors.each_with_index do |color, idx|
        if color != secret_code[idx]
          incorrect_idx << idx
          # color_shuffle << color
        end
      end
      # color_shuffle.shuffle!
      # for incorrect_idx.each do |i|
      #   included_colors[i] = color_shuffle[i]
      #   The only problem is it might check the same answer a couple
      #   of times. But I guess it's not that big a problem..?
      #  end
      incorrect_idx.each do |i|
        included_colors[i] = color_range[count]
      end
      count += 1
      end
    p "The final answer was found to be #{included_colors}"
    included_colors

    end

    def reorder_colors(secret, included_colors)
      
      
    end

  end
end