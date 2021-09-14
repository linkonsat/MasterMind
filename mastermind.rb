#so Let's set the respective classes
require 'pry-byebug'
module GameRules
    def valid_code()
      until ("1".."6").cover?(pin = gets.chomp) && pin.length == 4
        puts "Pin is out of range. Enter a number between 1-6"
      end
      return pin
    end
    
    def round_count()
      puts "Go ahead and select the number of rounds in between 8 -12"
    until ("8".."12").include?(round_amount = gets.chomp)   
    end
    return round_amount
  end
  #contains the pins that say which numbers you got right
end

    
def random_guess_gen()
  initial_guess = []
    4.times do
    initial_guess.push(rand(6))
    end
    return initial_guess 
  end



def round(new_game, player_role, ai)

end


def player_choice()
    puts "Welcome to MasterMind. Enter 0 to be the codemaker or 1 to be the codebreaker"
  until (("0".."1").include?(selected_role = gets.chomp))
  end
  selected_role.to_i

end

class Player
  include GameRules
    attr_accessor :role, :code
    def initialize(role)
        @role = role
    end
    
  def pin_creation
        puts "enter a 4 digit code with numbers between 1 - 6!"
        new_code = valid_code()
        split = new_code.split('')
        code = []
        split.each  { |item| code.push(item.to_i) }
        @code = code
  end  
    #has the ability to input a array of numbers and recieves a response
    #from the gamechoices module saying which pins are right

end

class AI
include GameRules
    attr_accessor :ai, :code, :guess, :initial_guess
    def initialize(ai,initial_guess)
        @ai = ai
        @initial_guess = initial_guess
    end
    def pin_creation_ai
    code = []
    @code = code
    4.times do
    code.push(rand(6))
    end
    end

      
    def guess(feedback)
      guess = random_guess_gen()
      
      feedback.each_index do |item, index| 
        if(item != "R") 
          guess[index] = rand(6) 
        end
      end
      @guess = guess

    
  end
        #simple ai that keeps positions it gets right

end

class GameRounds
  include GameRules
   attr_accessor :game
  def initialize(game)
    @game = game
  end

  def right_spot (guess, pins)
  feedback = []
  pins.each_with_index do |pin, index| 
    
    pin == guess[index] ? feedback.push("R") : feedback.push("W") 
  end
  return feedback
  end

  def wrong_position(guess, pins)

  feedback = []
  end

  def correct_pins(guess, pins)
  if (guess == pins)   
    return true
  end
  end
 #This is where the where the player decides to be the codemaker/breaker
    #also this is where the pins "live" and you recieve a response from the included gamechoices module

end

def game_start()

  player_role = Player.new(player_choice())
  ai = AI.new("computer",random_guess_gen)
  
  new_game = GameRounds.new("game")
  new_game.round_count()
  player_role.role == 0 ? player_role.pin_creation : ai.pin_creation_ai
  binding.pry
  round(new_game, player_role, ai)
end

game_start()