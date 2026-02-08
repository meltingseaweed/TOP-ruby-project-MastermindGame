#This creates the object which pulls the different methods

class Mastermind

  include Compare
  include MethodsToRun

  def initialize(name)
    @name = name
  end
  
end