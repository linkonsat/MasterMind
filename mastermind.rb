#so Let's set the respective classes

module GameRules
    def valid_code()
      until ("1".."6").include?(pin = gets.chomp)
        puts "Pin is out of range. Enter a number between 1-6"
      end
      return pin.to_i  
  end   
      #contains the pins that say which numbers you got right
  end

def game_start()
  player_role = Player.new(player_choice())
  rounds = GameChoices.new(round_count())
  player_role.pin_creation()
  p player_role 
  #role = player_role.role == 0 ? 
  new_game = GameChoices.new("blah")
end

def player_choice()
    puts "Welcome to MasterMind. Enter 0 to be the codemaker or 1 to be the codebreaker"
  until (("0".."1").include?(selected_role = gets.chomp))
  end
  selected_role.to_i

end

def round_count()
    puts "Go ahead and select the number of rounds in between 8 -12"
  until ("8".."12").include?(round_amount = gets.chomp)   
  end
  p round_amount.to_i
end
class Player
  include GameRules
    attr_accessor :role, :code
    def initialize(role)
        @role = role
    end
    
  def pin_creation
    code = []
    @code = code
    4.times do
        puts "enter a code with numbers between 1 - 6!"
        code.push(valid_code())
  end  
    #has the ability to input a array of numbers and recieves a response
    #from the gamechoices module saying which pins are right
end
end

class AI
    attr_accessor :ai
    def initialize(ai)
        @ai = ai
    end
        #simple ai that keeps positions it gets right

end

class GameChoices
  attr_accessor :code
  private
  def initialize(code)
      @code = code
  end
 #This is where the where the player decides to be the codemaker/breaker
    #also this is where the pins "live" and you recieve a response from the included gamechoices module
end

game_start()