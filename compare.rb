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
      user.each_with_index do |color, idx|
        if color == comp[idx]
          user.delete_at(idx)
          comp.delete_at(idx)
        end
      end
      # Need to now find the number of matching colors.
      user.each do |color|
        if comp.includes?(color)
          white_pins += 1
          comp.delete(color)
        end
      end
      white_pins
    end
end
