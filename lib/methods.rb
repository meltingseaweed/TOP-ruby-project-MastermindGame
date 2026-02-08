#This will contain a few methods for now

module MethodsToRun
  def generate_computer_input
    colors = ["r", "y", "b", "g", "m", "c"]
    3.times do 
      colors += colors
    end
    colors.sample(6)

  end
end