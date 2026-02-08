# These methods will compare if the code matches and return 
# the correct number of white or reds. 

module Compare
  # determines if the round is over
  def all_match(comp, user)
    if comp == user then true
    else false
    end
  end
  # exact_match can return the number of red pins
  def exact_match(comp, user)
    red_pins = 0
    user.each_with_index do |color, idx|
      if color == comp[idx]
        red_pins += 1
      end
    end
    red_pins
  end
  # near_matches can return the number of white pins
    def near_matches(comp, user)
      white_pins = 0
      unmatched_user = []
      unmatched_comp = []

      user.each_with_index do |color, idx|
        if (color != comp[idx])
          unmatched_user.push(color)
          unmatched_comp.push(comp[idx])
        end
      end
      # Need to now find the number of matching colors.
      unmatched_user.each do |color|
        if unmatched_comp.include?(color)
          puts "includes color #{color}"
          white_pins += 1
          unmatched_comp.delete(color)
          puts "unmatched_comp is now #{unmatched_comp}".colorize(:red)
        end
      end
      white_pins
    end
end
